class Purchase < ActiveRecord::Base
  attr_accessible :count, :item_id, :purchaser_id, :import_id

  has_one :item
  belongs_to :purchaser
  belongs_to :import
end
