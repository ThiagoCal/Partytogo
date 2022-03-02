class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :birthdate, numericality:  { greater_than_or_equal_to: 18}, presence: true
  has_many :bookmarks, dependent: :destroy
  has_many :parties, dependent: :destroy
end
