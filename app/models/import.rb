require 'csv'

class Import < ActiveRecord::Base
  attr_accessible :file_name, :content, :import_file
  attr_accessor :import_file
  has_many :purchases

  validates :file_name, presence: :true
  validates :content, presence: :true
  validate :check_file_in_valid_format

  def self.recent
    includes(:purchases => :item).order('created_at desc').limit(10)
  end

  def parse_file
    load_file
    return false unless save

    Import.transaction do
      CSV.parse(content, col_sep: "\t", headers: :first_row).each do |line|
        purchaser = Purchaser.find_or_create_by_name!(name: line['purchaser name'])
        merchant  = Merchant.find_or_create_by_name!(address: line['merchant address'], name: line['merchant name'])
        item      = Item.find_or_create_by_description_and_merchant_id!(description: line['item description'], price: line ['item price'], merchant_id: merchant.id)
        Purchase.create!(count: line['purchase count'], purchaser_id: purchaser.id, item_id: item.id, import_id: id)
      end
    end
  end

  def load_file
    return if import_file.nil?

    self.file_name = import_file.original_filename
    self.content = import_file.read
  end

  def check_file_in_valid_format
    return if content.nil?

    first_line = content.split("\n").first
    unless first_line.start_with? "purchaser name"
      errors.add(:content, "of '#{file_name}' does not appear to be in the correct tab-delimitted format")
    end
  end

  def gross_revenue
    purchases.to_a.sum(&:total_cost)
  end
end
