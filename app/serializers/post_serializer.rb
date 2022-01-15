class PostSerializer < ActiveModel::Serializer
  attributes  :id,
              :title,
              :content,
              :user_name,
              :created_at,
              :user_icon
  
  def user_icon
    object.user.user_icon
  end
end
