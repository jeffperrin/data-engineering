require 'csv'

class Import < ActiveRecord::Base
  attr_accessible :file_name, :content, :import_file
  attr_accessor :import_file
  has_many :purchases

  validates :file_name, presence: :true
  validates :content, presence: :true

  def parse_file
    load_file
    return false unless save

    Import.transaction do
      CSV.parse(content, col_sep: "\t", headers: :first_row).each do |line|
        purchaser = Purchaser.create!(name: line['purchaser name'])
        merchant  = Merchant.create!(address: line['merchant address'], name: line['merchant name'])
        item      = Item.create!(description: line['item description'], price: line ['item price'], merchant_id: merchant.id)

        purchases.build(count: line['purchase count'], purchaser_id: purchaser.id, item_id: item.id)
      end
    end
  end

  def load_file
    return if import_file.nil?

    self.file_name = import_file.original_filename
    self.content = import_file.read
  end
end
