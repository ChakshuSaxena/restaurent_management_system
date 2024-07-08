class Menu < ApplicationRecord
  belongs_to :restrau
  has_many :menu_items

  def find_menu_items
    @menu_item_list = self.menu_items
  end
end
