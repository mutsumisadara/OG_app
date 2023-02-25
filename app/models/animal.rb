class Animal < ApplicationRecord
    mount_uploader :picture, ImageUploader
    belongs_to :group
    has_many :animal_managements , dependent: :destroy
    # accepts_nested_attributes_for :animal_managements #追記
    validates :name, :birthday, presence: true
    validates :sex, inclusion: { in: [true, false], allow_nil: true }
end