class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :group, optional: true
  # has_many :owner_id, class_name: 'Group', foreign_key: "owner_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #, :validatable
  
  def self.guest
  find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = 'ゲストユーザー'
    user.group_id = 1
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = '管理者'
      user.admin = true
    end
  end
end
