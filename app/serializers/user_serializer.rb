class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :friends, :not_friends
  has_many :channels, through: :user_channel, serializer: ShallowChannelSerializer



  def relationships
    Relationship.friends(object)
  end

  def friends
    friends = object.followers + object.following
    friends.map{|x| ShallowUserSerializer.new(x)}
  end

  def not_friends
    nf = User.all - (object.followers + object.following)
    nf.map{|x| ShallowUserSerializer.new(x)}
  end

end
