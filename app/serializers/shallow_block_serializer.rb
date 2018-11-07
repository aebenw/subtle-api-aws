class ShallowBlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author
  # belongs_to :user, serializer: ShallowUserSerializer

  def author
    ShallowUserSerializer.new(object.user)
  end

end
