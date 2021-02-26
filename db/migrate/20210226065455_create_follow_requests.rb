class CreateFollowRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_requests do |t|
      t.references :user, null: false, foreign_key: false
      t.references :shop, null: false, foreign_key: false
      t.timestamps
    end
  end
end
