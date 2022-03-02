class Party < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :is_active, presence: true
  validates :capacity, presence: true
end
