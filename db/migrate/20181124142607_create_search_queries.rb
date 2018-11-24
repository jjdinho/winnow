class CreateSearchQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :search_queries do |t|
      t.references :news_feed, foreign_key: true
      t.string :sources
      t.string :domains
      t.date :from_date
      t.date :to_date
      t.integer :language
      t.integer :country

      t.timestamps
    end
  end
end
