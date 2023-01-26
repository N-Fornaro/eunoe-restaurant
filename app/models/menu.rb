# frozen_string_literal: true

class Menu < ApplicationRecord
  validates :meal, presence: true
end
