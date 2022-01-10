class User < ApplicationRecord
  has_one_attached :user_icon
  # has_many :post
end
