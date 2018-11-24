class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    newsapi = News.new(ENV['NEWS_API_KEY'])
    @sources = newsapi.get_everything(q: 'bitcoin',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2018-11-17',
                                      to: '2018-11-24',
                                      language: 'en',
                                      sortBy: 'popularity',
                                      pageSize: 100)
  end
end
