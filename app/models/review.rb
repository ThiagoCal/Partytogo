class Review < ApplicationRecord
  belongs_to :users
  belongs_to :parties
end
