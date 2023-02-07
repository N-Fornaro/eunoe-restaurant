class Meal < ApplicationRecord
  validates :dish, presence: true
end
