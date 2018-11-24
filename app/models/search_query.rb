class SearchQuery < ApplicationRecord
  belongs_to :news_feed
  has_many :sources, through: :news_feed

  enum language: [:ar, :de, :en, :es, :fr, :he, :it, :nl, :no, :pt, :ru, :se, :ud, :zh]
end
