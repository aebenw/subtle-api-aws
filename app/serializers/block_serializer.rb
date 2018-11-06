class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :channels
  has_many :channels, through: :channel_block

  def user
    user = User.find(object.user_id)
    return {user_id: object.user_id, name: user.name}
  end

  # def channels
  #    channels = object.channels
  #    return channels
  # end

end
