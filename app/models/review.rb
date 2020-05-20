class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: :true

  validates :rating, inclusion: { in: 0..5 }, numericality: :true
end
