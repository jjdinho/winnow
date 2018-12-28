class SendWeeklyMailJob < ApplicationJob
  queue_as :default

  def perform
    weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
    weekly_news_feeds.each do |feed|
      NewsFeedMailer.news_feed_weekly(feed)
    end
  end
end
