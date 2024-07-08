class User < ApplicationRecord
  has_many :orders
  has_many :restraus, through: :orders

  validates :email, uniqueness: true, presence: true
  validates :phone_number, uniqueness: true, presence: true
end
