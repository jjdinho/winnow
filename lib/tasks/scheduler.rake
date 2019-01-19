desc "This task is called by the Heroku scheduler add-on"
task :daily_task => :environment do
  puts "Sending emails..."
  ExecuteNewsFeedAndSendEmailJob.new.perform_now
  DestroySecurityHexesJob.new.perform_now
  puts "done."
end

