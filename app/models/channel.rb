class Channel < ApplicationRecord
  has_many :user_channels
  has_many :channel_blocks
  has_many :users, through: :user_channels
  has_many :blocks, through: :channel_blocks
end
