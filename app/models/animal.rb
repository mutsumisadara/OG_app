class Animal < ApplicationRecord
    belongs_to :group
    validates :name, presence: true
    validates :sex, inclusion: [true, false]
end