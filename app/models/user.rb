class User < ApplicationRecord
  has_many :user_channels
  has_many :channel_followers
  has_many :channels, through: :user_channels
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blocks, dependent: :destroy

  has_many :followed_channels, class_name: "ChannelFollower", foreign_key: "follower_id"

  #Self - joining

  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "followed_id",
                                dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  #active_storage profile pic
  has_one_attached :profile


  #bcrypt
  has_secure_password

  #validations
  validates :name, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :email, uniqueness: true, on: :create
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 4 }


  def friends

    friends = followers + following
    filter = friends.select{|x| x.id !=  self.id }
    return filter
  end





end
