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
      articles = feed.perform_daily
      NewsFeedMailer.news_feed_mail(feed, articles).deliver_now unless articles.empty?
    end
    puts "Processed #{daily_news_feeds.length} daily llamas"
  end

  def find_and_send_weekly
    if Date.today.wday == 1
      weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
      weekly_news_feeds.each do |feed|
        articles = feed.perform_weekly
        NewsFeedMailer.news_feed_mail(feed, articles).deliver_now unless articles.empty?
      end
      puts "Processed #{weekly_news_feeds.length} weekly llamas"
    else
      puts "Today is not Monday: no weekly news feeds sent."
    end
  end

  def find_and_send_monthly
    if Date.today.day == 1
      monthly_news_feeds = NewsFeed.where(frequency: "monthly", active: true)
      monthly_news_feeds.each do |feed|
        articles = feed.perform_monthly
        NewsFeedMailer.news_feed_mail(feed, articles).deliver_now unless articles.empty?
      end
      puts"Processed #{monthly_news_feeds.length} monthly llamas"
    else
      puts "Today is not the first of the month: monthly news feeds send."
    end
  end
end
