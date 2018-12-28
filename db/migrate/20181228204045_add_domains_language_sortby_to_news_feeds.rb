class AddDomainsLanguageSortbyToNewsFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :news_feeds, :domains, :string
    add_column :news_feeds, :language, :integer, default: 2
    add_column :news_feeds, :sortby, :integer, default: 1
  end
end
