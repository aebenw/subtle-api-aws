class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user
  has_many :channels, through: :channel_block
end
