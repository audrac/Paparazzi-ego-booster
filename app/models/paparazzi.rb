class Paparazzi < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user

  validates :name, :style, presence: true
end
