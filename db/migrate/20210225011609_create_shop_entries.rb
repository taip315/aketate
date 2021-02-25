class CreateShopEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_entries do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
