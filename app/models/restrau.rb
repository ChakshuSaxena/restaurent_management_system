class Restrau < ApplicationRecord
  has_one :menu
  has_many :orders
  has_many :users, through: :orders
end
