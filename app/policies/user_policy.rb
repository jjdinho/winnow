class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.news_feeds.empty?
  end

  def yay_you_did_it?
    true
  end

  # Policies for profile controller
  def profile?
    true
  end

  def update_profile?
    profile?
  end

  def update_email_settings
    profile?
  end
end
