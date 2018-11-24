class SearchQuery < ApplicationRecord
  belongs_to :news_feed
  has_many :news_sources, through: :news_feeds

  enum language: %I[ar de en es fr he it nl no pt ru se ud zh]
  enum sortby: %I[popularity relevancy publishedAt]
end
