class NewsFeed < ApplicationRecord
  belongs_to :user
  has_many :search_queries
  has_and_belongs_to_many :news_sources

  enum frequency: [:daily, :weekly, :monthly]
  enum language: %I[ar de en es fr he it nl no pt ru se ud zh]
  enum sortby: %I[popularity relevancy publishedAt]

  def perform_weekly
    return false if frequency != "weekly"

    sources_string = news_sources.map { |source| source.id_tag }.join(',')

    newsapi = News.new(ENV['NEWS_API_KEY'])
    @search_result = newsapi.get_everything(q: keyword,
                                            sources: sources_string,
                                            from: (Date.today - 7).to_s,
                                            to: Date.today.to_s,
                                            language: language,
                                            sortBy: sortby,
                                            pageSize: 100).first(10)
  end
end
