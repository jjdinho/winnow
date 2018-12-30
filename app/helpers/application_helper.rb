module ApplicationHelper
  def news_feeds_frequencies_collection
    NewsFeed.frequencies.map do |kind, _key|
      kind
    end
  end

  # Devise for sign up form on home page
  def resource_name
    :user
  end

  def resource_class
     User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
