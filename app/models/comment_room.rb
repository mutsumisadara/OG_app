class CommentRoom < ApplicationRecord
  belongs_to :group
  has_many :comments, dependent: :destroy
  validates :content, presence: true, { maximum: 255 }
end