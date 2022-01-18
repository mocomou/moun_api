class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :id,
              :user_name
              # :posts
  attribute   :user_icon, if: :has_user_icon?
  has_many :posts

  def user_icon
    rails_blob_path(object.user_icon, only_path: true)
  end

  def has_user_icon?
    object.user_icon.attached?
  end

  # def posts
  #   object.posts
  # end
end
