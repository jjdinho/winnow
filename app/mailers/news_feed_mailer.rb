class NewsFeedMailer < ApplicationMailer
  def news_feed_mail(news_feed, articles)
    # get news_feed
    @news_feed = news_feed
    @frequency = @news_feed.frequency
    @user = news_feed.user
    @articles = articles

    # send email
    if @frequency == "daily"
      mail(to: @user.email, subject: "Daily News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    elsif @frequency == "weekly"
      mail(to: @user.email, subject: "Weekly News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    elsif @frequency == "monthly"
      mail(to: @user.email, subject: "Monthly News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    end
    # This will render a view in `app/views/news_feed_mailer`!
  end
end
