class Group < ApplicationRecord
    validates :name, presence: true

    has many :users, dependent: :destroy
    has many :animals, dependent: :destroy
    has many :comment_rooms, dependent: :destroy
    has many :schedules, dependent: :destroy
end
