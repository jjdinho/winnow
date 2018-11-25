class NewsFeedsController < ApplicationController
  def index

  end

  def new
    @news_feed = NewsFeed.new
  end

  def create
    raise
  end
end
