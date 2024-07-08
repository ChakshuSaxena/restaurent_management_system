class Order < ApplicationRecord
  belongs_to :restrau
  belongs_to :user
  has_many :order_items
  accepts_nested_attributes_for :order_items

  after_save do |order|
    order.update(total_amount: @order.total_order_item_price)
  end

  def find_order_items
    @order_item_list = self.order_items
  end

  def total_order_item_price
    sum = 0
    self.order_items.each do |item|
      sum += item.menu_item.price
    end
    sum
  end
end
