class Animal < ApplicationRecord
    belongs_to :group
    has_many :animal_managements
    validates :name, presence: true
    validates :sex, inclusion: [true, false]
end