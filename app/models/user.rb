class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, :length => { :in => 2..20 }
  validates :email, presence: true, uniqueness: true
  validates :introduction,  length: {maximum: 50}
  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  attachment :profile_image

  has_many :books, dependent: :destroy
end
