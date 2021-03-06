class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :post
end
