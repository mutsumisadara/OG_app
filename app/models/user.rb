class User < ApplicationRecord
  belongs_to :group
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
  find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = '管理者'
      user.admin = true
      # profile = user.build_profile
    end
  end
end
