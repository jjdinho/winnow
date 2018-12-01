class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Winnow!', track_opens: 'true')
    # This will render a view in `app/views/user_mailer`!
  end

  def news_feed(user)
    # get user
    # get news feeds
    # perform search query SearchQuery.perform
    # send email
  end
end
