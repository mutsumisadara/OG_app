class Animal < ApplicationRecord
    belongs_to :group
    validates :name, presence: true
    validates :name, presence: true
    # validates :name, checked, inclusion: [true, false]
    enum sex: { メス♀: true, オス♂: false } 
end