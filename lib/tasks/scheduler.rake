desc "This task is called by the Heroku scheduler add-on"
task :send_weekly_emails => :environment do
  puts "Sending weekly emails..."
  SendWeeklyMailJob.perform_later
  puts "done."
end

