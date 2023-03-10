class Paparazzi < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if:
  :will_save_change_to_location?

  validates :name, :style, :location, :price, presence: true
  validates :description, presence: true
end
