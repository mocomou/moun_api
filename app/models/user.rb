class User < ApplicationRecord
  has_one_attached :user_icon
  validates :user_name, presence: true, length: { maximum: 12 },
                        uniqueness: true
  # has_many :post
end
