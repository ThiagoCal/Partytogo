class Bookmark < ApplicationRecord
  belongs_to :users
  belongs_to :parties
  validates_uniqueness_of :party_id, scope: [:user_id]
end
