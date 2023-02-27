class Paparazzi < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user

  validates :name, :style, :location, :price, presence: true
  validates :description, presence: true
end
