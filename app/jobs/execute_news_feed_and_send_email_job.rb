class ExecuteNewsFeedAndSendEmailJob < ApplicationJob
  queue_as :default

  def perform
    # Send Daily
    find_and_send_daily
    # Send Weekly
    find_and_send_weekly
    # Send Monthly
    find_and_send_monthly
  end

  private

  def find_and_send_daily
    daily_news_feeds = NewsFeed.where(frequency: "daily", active: true)
    daily_news_feeds.each do |feed|
      NewsFeedMailer.news_feed_mail(feed).deliver_now
    end
    puts "Sent #{daily_news_feeds.length} daily emails"
  end

  def find_and_send_weekly
    if Date.today.wday == 1
      weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
      weekly_news_feeds.each do |feed|
        NewsFeedMailer.news_feed_mail(feed).deliver_now
      end
      puts "Sent #{weekly_news_feeds.length} weekly emails"
    else
      puts "Today is not Monday: no weekly news feeds sent."
    end
  end

  def find_and_send_monthly
    if Date.today.day == 1
      monthly_news_feeds = NewsFeed.where(frequency: "monthly", active: true)
      monthly_news_feeds.each do |feed|
        NewsFeedMailer.news_feed_mail(feed).deliver_now
      end
      puts"Sent #{monthly_news_feeds.length} monthly emails"
    else
      puts "Today is not the first of the month: monthly news feeds send."
    end
  end
end
