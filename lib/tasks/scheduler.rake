desc "This task is called by the Heroku scheduler add-on"
task :send_weekly_emails => :environment do
  puts "Sending weekly emails..."
  # SendWeeklyMailJob.perform_later

  if Date.today.wday == 1
    weekly_news_feeds = NewsFeed.where(frequency: "weekly", active: true)
    weekly_news_feeds.each do |feed|
      NewsFeedMailer.weekly_news_feed(feed).deliver_now
    end
    puts "Sent #{weekly_news_feeds.length} emails"
  else
    puts "Today is not Monday"
  end


  puts "done."
end

