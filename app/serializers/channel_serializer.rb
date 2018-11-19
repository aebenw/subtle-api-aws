class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :authors, :blocks, :followers
  # has_many :users, through: :user_channel, serializer: ShallowUserSerializer
  # has_many :blocks, through: :channel_block, serializer: ShallowBlockSerializer

  def blocks
    object.blocks.map{ |x|
      ShallowBlockSerializer.new(x)
    }
  end

  def authors
    object.users.map{|x| ShallowUserSerializer.new(x)}
  end

  def followers
    object.followers.map{|x|
    ShallowUserSerializer.new(x)}
  end

end
