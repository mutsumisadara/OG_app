class Animal < ApplicationRecord
    belongs_to :group
    validates :name, presence: true
    validates :sex, presence: true
    enum sex: { メス♀: 1, オス♂: 0 } 
end