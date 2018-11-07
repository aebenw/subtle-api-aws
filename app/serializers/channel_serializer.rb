class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :blocks
  has_many :users, through: :user_channel
  # has_many :blocks, through: :channel_block

  def blocks
    object.blocks.map{ |x|
    user = x.user.name
    {block: x, name: user}
    }
  end

end

# ActiveModelSerializers::Adapter::Json.new(BlockSerializer.new(x))
