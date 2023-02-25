class CommentRoom < ApplicationRecord
  belongs_to :group
  validates :content, presence: true
end