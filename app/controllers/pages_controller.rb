class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # newsapi = News.new(ENV['NEWS_API_KEY'])
    # @sources = newsapi.get_sources(country: 'us', language: 'en')

    @search_query = NewsFeed.new
  end

  def home_search_query
    newsapi = News.new(ENV['NEWS_API_KEY'])
    @search_result = newsapi.get_everything(q: params[:query],
                                            sources: 'bbc-news,the-verge',
                                            domains: 'bbc.co.uk,techcrunch.com',
                                            from: (Date.today - 7).to_s,
                                            to: Date.today.to_s,
                                            language: 'en',
                                            sortBy: 'relevancy',
                                            pageSize: 100).first(5)

    render json: @search_result
  end
end
