class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :likes
  has_many :comments
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, uniqueness: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: "guestさん") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end


  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


end
