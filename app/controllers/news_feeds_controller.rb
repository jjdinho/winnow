class NewsFeedsController < ApplicationController
  def index

  end

  def new
    @news_feed = NewsFeed.new
  end

  def create
    @news_feed = NewsFeed.new(news_feed_params)
    @news_feed.user = current_user
    if @news_feed.save
      flash[:notice] = "Successful"
      redirect_to root_path
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
