class Room < ApplicationRecord
  has_many :user_entries
  has_many :users, through: :user_entries
  has_many :shop_entries
  has_many :shops, through: :shop_entries
end
