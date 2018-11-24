class RemoveCountryFromSearchQueriesAndAddSortByColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :search_queries, :country
    add_column :search_queries, :sortby, :integer
  end
end
