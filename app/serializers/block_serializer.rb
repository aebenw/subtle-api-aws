class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :channels
  # has_many :channels, through: :channel_block



  def author
    object.user
  end

  def channels
    object.channels.map{|x| ShallowChannelSerializer.new(x)}
  end

end
