class User < ApplicationRecord
  has_many :listings, foreign_key: :host_id, inverse_of: :host, dependent: :nullify
  has_many :reservations, through: :listings, source: :reservations # host’s reservations via listings

  has_many :trips, class_name: 'Reservation', foreign_key: :guest_id, inverse_of: :guest, dependent: :destroy
  has_many :reviews, foreign_key: :guest_id, inverse_of: :guest, dependent: :destroy
end
