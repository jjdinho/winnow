class CreateNewsFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :news_feeds do |t|
      t.references :user, foreign_key: true
      t.integer :frequency
      t.string :keyword

      t.timestamps
    end
  end
end
