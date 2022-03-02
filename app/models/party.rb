class Party < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true
end
