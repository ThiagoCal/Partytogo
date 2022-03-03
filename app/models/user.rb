class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :birthdate, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :parties, dependent: :destroy
  has_one_attached :photo

end
