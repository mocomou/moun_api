class User < ApplicationRecord
  has_many :posts
  has_one_attached :user_icon
  validates :user_name, presence: true, length: { maximum: 13 },
                        uniqueness: true,
                        format: { with: /\A[a-zA-Z0-9]+\z/}

end
