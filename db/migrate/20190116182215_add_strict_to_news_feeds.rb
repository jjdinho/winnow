class AddStrictToNewsFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :news_feeds, :strict, :boolean, default: true
  end
end
