class Animal < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :group
  has_many :animal_managements , dependent: :destroy
  validates :name, :birthday, presence: true
  validates :sex, inclusion: { in: [true, false], allow_nil: true }
end