class Party < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookmarks
end
