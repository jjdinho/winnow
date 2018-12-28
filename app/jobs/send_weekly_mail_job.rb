class SendWeeklyMailJob < ApplicationJob
  queue_as :default

  def perform
    counter = 0
    weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
    weekly_news_feeds.each do |feed|
      NewsFeedMailer.news_feed_weekly(feed).deliver_now
      counter += 1
    end
  end
  return "Sent #{counter} emails."
end
