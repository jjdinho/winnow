class NewsFeedsController < ApplicationController
  def index

  end

  def new
    @news_feed = NewsFeed.new
  end

  def create

  end
end
