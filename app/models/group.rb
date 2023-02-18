class Group < ApplicationRecord
    validates :name, presence: true
    belongs_to :owner, class_name: 'User'
    has_many :users
    has_many :animals, dependent: :destroy
    has_many :comment_rooms, dependent: :destroy
    has_many :schedules, dependent: :destroy
end