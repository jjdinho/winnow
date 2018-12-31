class User < ApplicationRecord
  has_many :news_feeds

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email

  def name
    if first_name && last_name
      return first_name + " " + last_name
    else
      return nil
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
