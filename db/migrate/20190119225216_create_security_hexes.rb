class CreateSecurityHexes < ActiveRecord::Migration[5.2]
  def change
    create_table :security_hexes do |t|
      t.string :hex

      t.timestamps
    end
  end
end
