class ShopEntry < ApplicationRecord
  belongs_to :shop
  belongs_to :room
end
