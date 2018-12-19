class CreateIntermediateTableSourcesFeeds < ActiveRecord::Migration[5.2]
  def change
    create_join_table :news_feeds, :news_sources do |t|
      t.index [:news_feed_id, :news_source_id]
    end
  end
end
