class User < ApplicationRecord
  has_many :news_feeds

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email

  def name
    first_name && last_name ? first_name + " " + last_name : nil
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
