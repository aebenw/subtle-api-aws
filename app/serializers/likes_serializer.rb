class LikesSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :likes
end
