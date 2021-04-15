class ReservationRequest < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  with_options presence: true do
    validates :start_time
    validates :number_of_people, numericality: true
  end
end
