class Group < ApplicationRecord
    validates :name, presence: true
    belongs_to :owner_id, class_name: 'User', foreign_key: "owner_id"
    # owner_idにグループを作ったuserのidを格納させる
    has_many :owner_id, class_name: 'Group', foreign_key: 'owner_id'
    has_many :users
    has_many :animals, dependent: :destroy
    has_many :comment_rooms, dependent: :destroy
    has_many :schedules, dependent: :destroy
end