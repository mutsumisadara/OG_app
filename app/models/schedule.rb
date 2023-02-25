class Schedule < ApplicationRecord
  belongs_to :group
  validates :content, :start_time, presence: true
end