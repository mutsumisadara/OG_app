class Animal < ApplicationRecord
    mount_uploader :picture, ImageUploader
    belongs_to :group
    has_many :animal_managements , dependent: :destroy
    # accepts_nested_attributes_for :animal_managements #追記
    validates :name, presence: true
    validates :sex, inclusion: [true, false]
end