class ApplicationJob < ActiveJob::Base
  def send_news_feed_monday_mail
    # Get all users' news_feeds and send mails
  end
end
