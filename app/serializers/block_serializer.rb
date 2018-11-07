class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :channels
  has_many :channels, through: :channel_block



  def author
    object.user
  end

end
