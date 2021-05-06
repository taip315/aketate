class CreateFollowRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_requests do |t|
      t.references :user, null: false, foreign_key: false
      t.references :shop, null: false, foreign_key: false
      t.timestamps

      t.index %i[user_id shop_id], unique: true
    end
  end
end
