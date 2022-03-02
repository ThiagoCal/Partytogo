class Review < ApplicationRecord
  belongs_to :users
  belongs_to :parties
  validates :content, presence: true, length: { minimum: 10 }
end
