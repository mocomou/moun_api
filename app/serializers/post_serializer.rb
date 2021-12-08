class PostSerializer < ActiveModel::Serializer
  attributes  :id,
              :title,
              :content,
              :user_name,
              :user_icon

  def user_name
    object.user.user_name
  end

  def user_icon
    object.user.user_icon
  end
end
