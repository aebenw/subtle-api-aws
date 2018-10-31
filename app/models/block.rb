class Block < ApplicationRecord
  has_many :channel_blocks
  has_many :channels, through: :channel_blocks
  belongs_to :user
end
