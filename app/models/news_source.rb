class NewsSource < ApplicationRecord
  has_and_belongs_to_many :news_feeds
end
