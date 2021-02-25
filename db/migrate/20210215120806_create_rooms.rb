class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :user,  foreign_key: true,  null: false
      t.references :shop,  foreign_key: true,  null: false
      t.timestamps
    end
  end
end
