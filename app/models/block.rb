class Block < ApplicationRecord
  has_many :channel_blocks
  has_many :channels, through: :channel_blocks
  has_many :comments
  belongs_to :user

  #PDF/IMAGE attatched to block
  has_one_attached :file

end
