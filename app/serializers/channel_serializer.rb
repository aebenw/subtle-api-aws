class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :blocks
  has_many :users, through: :user_channel
  # has_many :blocks, through: :channel_block

  def blocks
    object.blocks.map{ |x|
    user = x.user
    {block: x, user: user}
    }
  end

end

# ActiveModelSerializers::Adapter::Json.new(BlockSerializer.new(x))
