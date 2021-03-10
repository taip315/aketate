class CreateReservationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_requests do |t|
      t.references :user,  null: false, foreign_key: false
      t.references :shop,  null: false, foreign_key: false
      t.datetime :start_time,  null: false
      t.string :number_of_people,  null: false
      t.text :remarks
      t.timestamps
    end
  end
end
