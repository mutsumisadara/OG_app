class Group < ApplicationRecord
    validates :name, presence: true

    has_many :users
    has_many :animals, dependent: :destroy
    # has_many :comment_rooms, dependent: :destroy
    # has_many :schedules, dependent: :destroy

end
