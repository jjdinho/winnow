class NewsFeedsController < ApplicationController
  def index
    @news_feeds = current_user.news_feeds
  end

  def new
    @news_feed = NewsFeed.new
  end

  def create
    @news_feed = NewsFeed.new(news_feed_params)
    @news_feed.user = current_user
    if @news_feed.save
      flash[:notice] = "Successful"
      if request.referer[-25..-1] == "make_your_first_news_feed"
        redirect_to you_are_all_set_path
      else
        redirect_to root_path
      end
    else
      flash[:alert] = "Failed"
      render :new
    end
  end

  def edit

  end

  def updated

  end

  def destroy

  end

  private

  def news_feed_params
    params.require(:news_feed).permit(:frequency, :keyword, news_source_ids: [])
  end
end
