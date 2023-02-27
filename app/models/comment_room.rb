class CommentRoom < ApplicationRecord
  belongs_to :group
  validates :content, presence: true, length: { in: 1..140 }
end