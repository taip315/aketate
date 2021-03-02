class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: false
      t.references :shop, null: false, foreign_key: false

      t.timestamps

      t.index [:user_id, :shop_id], unique: true
    end
  end
end
