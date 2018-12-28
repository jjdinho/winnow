desc "This task is called by the Heroku scheduler add-on"
task :send_weekly_emails => :environment do
  puts "Sending weekly emails..."
  # SendWeeklyMailJob.perform_later
  #
  weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
  weekly_news_feeds.each do |feed|
    NewsFeedMailer.news_feed_weekly(feed)
  end
  #
  puts "done."
end

