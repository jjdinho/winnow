class CreateNewsSources < ActiveRecord::Migration[5.2]
  def change
    create_table :news_sources do |t|
      t.references :news_feed, foreign_key: true
      t.string :source_id_tag
      t.string :name

      t.timestamps
    end
  end
end
