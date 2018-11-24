class ChangeColumnNameSourceIdTagInNewsSources < ActiveRecord::Migration[5.2]
  def change
    remove_column :news_sources, :source_id_tag
    add_column :news_sources, :id_tag, :string
  end
end
