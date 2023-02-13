class AnimalManagement < ApplicationRecord
  belongs_to :animal
  validates :recorded_on, :content, :temprature, :animal_id presence: true
end
