class UserSerializer < ActiveModel::Serializer
  attributes  :id,
              :user_name,
              :user_icon
              :posts

  has_many :posts
end
