class NewsFeed < ApplicationRecord
  belongs_to :user
  has_many :search_queries
  has_and_belongs_to_many :news_sources

  enum frequency: [:daily, :weekly, :monthly]
  enum language: %I[ar de en es fr he it nl no pt ru se ud zh]
  enum sortby: %I[popularity relevancy publishedAt]

  def sources
    news_sources
  end

  def perform_daily
    return false if frequency != "daily"
    send_search_query(Date.today - 1)
  end

  def perform_weekly
    return false if frequency != "weekly"
    send_search_query(Date.today - 7)
  end

  def perform_monthly
    return false if frequency != "monthly"
    send_search_query(Date.today - 1.month)
  end

  private

  def send_search_query(from_date)
    sources_string = news_sources.map { |source| source.id_tag }.join(',')

    newsapi = News.new(ENV['NEWS_API_KEY'])
    @results = newsapi.get_everything(q: keyword,
                                            sources: sources_string,
                                            from: (from_date).to_s,
                                            to: Date.today.to_s,
                                            language: language,
                                            sortBy: sortby,
                                            pageSize: 100)

    if self.strict?
      filter_results
    else
      @results.first(10)
    end
  end

  def filter_results
    @results = @results.select do |article|
      article.title =~ /#{keyword}/i || article.description =~ /#{keyword}/i
    end

    @results.first(10)
  end
end
