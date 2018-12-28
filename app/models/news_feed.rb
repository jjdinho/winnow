class NewsFeed < ApplicationRecord
  belongs_to :user
  has_many :search_queries
  has_and_belongs_to_many :news_sources

  enum frequency: [:daily, :weekly, :monthly]
  enum language: %I[ar de en es fr he it nl no pt ru se ud zh]
  enum sortby: %I[popularity relevancy publishedAt]
end
