class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :home_search_query, :make_your_first_news_feed]

  before_action :check_format, only: :home_search_query

  def home
    redirect_to news_feeds_path and return if current_user
    # newsapi = News.new(ENV['NEWS_API_KEY'])
    # @sources = newsapi.get_sources(country: 'us', language: 'en')

    @search_query = NewsFeed.new
  end

  def feed
    authorize current_user
  end

  def you_are_all_set
    authorize current_user
  end

  def make_your_first_news_feed
    # authorize current_user
  end

  def home_search_query
    newsapi = News.new(ENV['NEWS_API_KEY'])
    search_sources = params[:sources]
    @search_result = newsapi.get_everything(q: params[:query],
                                            sources: search_sources,
                                            from: (Date.today - 7).to_s,
                                            to: Date.today.to_s,
                                            language: 'en',
                                            sortBy: 'relevancy',
                                            pageSize: 100).first(10)
    respond_to do |format|
      format.json { render json: @search_result }
    end
  end

  def awesome_llama
    redirect_to root_path
  end

  private

  def check_format
    redirect_to root_url unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
  end
end
