class Group < ApplicationRecord
    validates :name, presence: true

    # has many :users
    # has many :animals, dependent: :destroy
    # has many :comment_rooms, dependent: :destroy
    # has many :schedules, dependent: :destroy
end
