class ShallowChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :authors

  def authors
    object.users.map{|x| ShallowUserSerializer.new(x)}
  end
  
end
