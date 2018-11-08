class ShallowBlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :comments
  # belongs_to :user, serializer: ShallowUserSerializer

  def author
    ShallowUserSerializer.new(object.user)
  end

  def comments
    object.comments.map{|x| ShallowCommentSerializer.new(x) }
  end

end
