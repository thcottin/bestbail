class Bail < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
end
