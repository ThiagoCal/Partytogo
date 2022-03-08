class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :party
  validates_uniqueness_of :party_id, scope: [:user_id]
end
