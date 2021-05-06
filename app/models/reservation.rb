class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :start_time
    validates :number_of_people
  end
end
