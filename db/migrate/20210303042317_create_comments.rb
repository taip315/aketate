class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: false
      t.references :shop, null: false, foreign_key: false
      t.references :post, null: false, foreign_key: false

      t.timestamps
    end
  end
end
