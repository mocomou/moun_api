class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :id,
              :user_name

  attribute   :user_icon, if: :has_user_icon?
              # :posts

  def user_icon
    rails_blob_path(object.user_icon, only_path: true)
  end

  def has_user_icon?
    object.user_icon.attached?
  end
end
