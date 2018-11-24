class NewsFeed < ApplicationRecord
  belongs_to :user
  has_many :search_queries
  has_and_belongs_to_many :news_sources

  enum frequency: [:daily, :weekly, :monthly]
end
