class ChannelFollower < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :channel


end
