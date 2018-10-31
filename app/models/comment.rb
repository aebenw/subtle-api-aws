class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :block
  has_many :likes
end
