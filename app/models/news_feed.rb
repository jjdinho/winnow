class NewsFeed < ApplicationRecord
  belongs_to :user
  has_many :search_queries
  has_many :sources

  enum frequency: [ :daily, :weekly, :monthly ]
end
