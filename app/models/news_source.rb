class NewsSource < ApplicationRecord
  belongs_to :news_feed

  enum source_id_tag: []
end
