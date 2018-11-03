class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author_name
  belongs_to :user
  has_many :channels, through: :channel_block

  def author_name
    User.find(object.user_id).name
  end
end
