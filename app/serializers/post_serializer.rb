class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :id,
              :title,
              :content,
              :created_at,
              :user_icon,
              :user_name
  
  def user_icon
    rails_blob_path(object.user.user_icon, only_path: true)
  end

  def user_name
    object.user.user_name
  end
end
