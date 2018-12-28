class SendWeeklyMailJob < ApplicationJob
  queue_as :default

  def perform
    weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
    weekly_news_feeds.each do |feed|
      NewsFeedMailer.weekly_news_feed(feed).deliver_now
    end
    puts "Sent #{weekly_news_feeds.length} emails"
  end
end
