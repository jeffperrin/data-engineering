class Purchase < ActiveRecord::Base
  attr_accessible :count, :item_id, :purchaser_id, :import_id

  belongs_to :item
  belongs_to :purchaser
  belongs_to :import

  def total_cost
    return 0 if item.nil?
    return 0 if item.price.nil?
    item.price * count
  end
end
