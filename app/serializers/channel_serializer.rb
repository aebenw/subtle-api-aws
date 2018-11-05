class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :blocks
  has_many :users, through: :user_channel
  has_many :blocks, through: :channel_block

  def blockss
    object.blocks.map{ |x| x.user.name }
  end

end

# ActiveModelSerializers::Adapter::Json.new(BlockSerializer.new(x))
