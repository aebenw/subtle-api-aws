class Like < ApplicationRecord
  belongs_to :block
  belongs_to :user
  belongs_to :comment
end
