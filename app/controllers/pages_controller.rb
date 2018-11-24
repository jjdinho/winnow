class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # newsapi = News.new(ENV['NEWS_API_KEY'])
    # @sources = newsapi.get_sources(country: 'us', language: 'en')

    @news_feed = NewsFeed.new
  end
end
