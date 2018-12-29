desc "This task is called by the Heroku scheduler add-on"
task :execute_news_feed_and_send_email => :environment do
  puts "Sending emails..."
  ExecuteNewsFeedAndSendEmailJob.new.perform_now
  puts "done."
end

