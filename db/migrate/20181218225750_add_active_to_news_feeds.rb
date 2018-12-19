class AddActiveToNewsFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :news_feeds, :active, :boolean, default: true
  end
end
