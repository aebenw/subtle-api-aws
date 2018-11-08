class Block < ApplicationRecord
  has_many :channel_blocks
  has_many :channels, through: :channel_blocks
  has_many :comments
  belongs_to :user
end
