class Neighborhood < ApplicationRecord
  belongs_to :city
  has_many :listings, dependent: :destroy
end
