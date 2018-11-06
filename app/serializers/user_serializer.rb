class UserSerializer < ActiveModel::Serializer
  attributes :id, :relationships, :name, :email, :blocks, :friends, :not_friends
  has_many :blocks
  has_many :channels, through: :user_channel
  has_many :comments
  has_many :likes


  # def blockWithAuth
  #   byebug
  #   object.channels.blocks.map
  #
  # end


  def relationships
    Relationship.friends(object)
  end

  def friends
    friends = object.followers + object.following
    return friends
  end

  def not_friends
    nf = User.all - (object.followers + object.following)
    return nf
  end

end
