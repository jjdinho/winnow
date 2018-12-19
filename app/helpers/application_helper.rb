module ApplicationHelper
  def news_feeds_frequencies_collection
    NewsFeed.frequencies.map do |kind, _key|
      kind
    end
  end
end
