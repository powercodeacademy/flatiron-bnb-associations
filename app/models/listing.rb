class Listing < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :host, class_name: 'User'

  has_many :reservations, dependent: :destroy
  has_many :guests, through: :reservations, source: :guest
  has_many :reviews, through: :reservations
end
