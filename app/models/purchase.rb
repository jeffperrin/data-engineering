class Purchase < ActiveRecord::Base
  attr_accessible :count, :item_id, :purchaser_id, :import_id

  belongs_to :item
  belongs_to :purchaser
  belongs_to :import

  def total_cost
    item.price * count
  end
end
