class Walk < ApplicationRecord
  validates :title, :description, :difficulty, :duration, :city, :distance, presence: true
end
