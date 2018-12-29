class NewsFeedMailer < ApplicationMailer
  def news_feed_mail(news_feed)
    # get news_feed
    @news_feed = news_feed
    @frequency = @news_feed.frequency
    @user = news_feed.user

    # send email
    if @frequency == "daily"
      @articles = @news_feed.perform_daily
      mail(to: @user.email, subject: "Daily News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    elsif @frequency == "weekly"
      @articles = @news_feed.perform_weekly
      mail(to: @user.email, subject: "Weekly News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    elsif @frequency == "monthly"
      @articles = @news_feed.perform_monthly
      mail(to: @user.email, subject: "Monthly News Feed for: #{@news_feed.keyword}", track_opens: 'true')
    end
    # This will render a view in `app/views/news_feed_mailer`!
  end
end
