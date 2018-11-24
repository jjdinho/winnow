class CreateIntermediateTableSourcesFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :sources_feeds, id: false do |t|
      t.belongs_to :news_feed, index: true
      t.belongs_to :news_source, index: true
    end
  end
end
