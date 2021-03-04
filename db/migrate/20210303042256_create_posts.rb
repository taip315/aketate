class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :wine_name, null: false
      t.text :content, null: false
      t.integer :price, null: false
      t.integer :open_date_id, null: false
      t.integer :wine_genre_id, null: false
      t.references :shop, null: false
      t.boolean :sold_out, null: false, defalt: false
      t.timestamps
    end
  end
end
