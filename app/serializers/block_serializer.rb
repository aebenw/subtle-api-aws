class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :channels
  has_many :comments



  def author
    ShallowUserSerializer.new(object.user)
  end

  def channels
    object.channels.map{|x| ShallowChannelSerializer.new(x)}
  end

  def comments
    object.comments.map{|x| ShallowCommentSerializer.new(x)}
  end

end
