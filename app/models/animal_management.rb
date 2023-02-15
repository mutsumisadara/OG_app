class AnimalManagement < ApplicationRecord
  belongs_to :animal
  validates :recorded_on, presence: true
  validates :content, presence:true
  validates :temprature, presence:true
end
