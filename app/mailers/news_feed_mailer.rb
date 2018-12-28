class NewsFeedMailer < ApplicationMailer
  def news_feed_weekly(news_feed)
    # get news_feed
    @news_feed = news_feed
    @user = news_feed.user

    @articles = @news_feed.perform_weekly

    # send email
    mail(to: @user.email, subject: "Weekly News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    # This will render a view in `app/views/news_feed_mailer`!
  end
end
