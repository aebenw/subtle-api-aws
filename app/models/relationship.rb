class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true


  scope :friends, -> (user) do
  where("(relationships.followed_id = ? OR relationships.follower_id = ?)", user.id, user.id)
  end



end
