class BlockSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  has_many :channels, through: :channel_block
end
