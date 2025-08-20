class City < ApplicationRecord
  has_many :neighborhoods, dependent: :destroy
  has_many :listings, through: :neighborhoods
end
