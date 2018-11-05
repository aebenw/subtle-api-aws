class UserSerializer < ActiveModel::Serializer
  attributes :id, :relationships, :name, :email, :blocks
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

end
