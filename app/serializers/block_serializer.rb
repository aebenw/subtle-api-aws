class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :channels, :image, :file
  has_many :comments


  def file
    if object.file.filename
      Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
      # object.file.filename
    end
  end

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
