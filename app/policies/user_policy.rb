class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def feed?
    true
  end

  def you_are_all_set?
    true
  end

  def make_your_first_news_feed?
    record.news_feeds.empty?
  end
end
