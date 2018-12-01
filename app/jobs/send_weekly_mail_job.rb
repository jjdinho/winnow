class SendWeeklyMailJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "heeeeeyyyyy"
    UserMailer.welcome(User.first)
    puts "done"
  end
end
