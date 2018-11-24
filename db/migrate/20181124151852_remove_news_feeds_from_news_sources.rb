class RemoveNewsFeedsFromNewsSources < ActiveRecord::Migration[5.2]
  def change
    remove_column :news_sources, :news_feed_id
  end
end
