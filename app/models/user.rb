class User < ApplicationRecord
  has_many :user_channels
  has_many :channels, through: :user_channels
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blocks, through: :channels, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "followed_id",
                                dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_secure_password

end
