class Item < ActiveRecord::Base
  attr_accessible :description, :merchant_id, :price
  belongs_to :merchant
end
