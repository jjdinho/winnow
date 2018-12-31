class User < ApplicationRecord
  has_many :news_feeds

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email
  after_create :add_to_mailchimp

  def name
    first_name && last_name ? first_name + " " + last_name : nil
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def add_to_mailchimp
    return unless Rails.env.production?
    first_name.nil? ? first = "User" : first = first_name
    last_name.nil? ? last = "#{id}" : last = last_name
    Gibbon::Request.lists("9b875ac16e").members
              .create(body: {email_address: email,
              status: "subscribed",
              merge_fields: {FNAME: first, LNAME: last}})
  end
end
