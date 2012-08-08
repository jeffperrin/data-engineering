require 'spec_helper'

describe Import do
  describe "#parse_file" do

    context "empty file" do
      before(:each) do
        @import = Import.new(file_name: 'test.tab', content: '')
        @import.parse_file
      end

      it "doesn't do anything" do
        pending
      end
    end

    context "no header line" do
      before(:each) do
        @import = Import.new(file_name: 'test.tab', content: '')
        @import.parse_file
      end

      it "doesn't do anything" do
        pending
      end
    end

    context "header line exists without any data" do
      before(:each) do
        @import = Import.new(file_name: 'test.tab', content: '')
        @import.parse_file
      end

      it "doesn't do anything" do
        pending
      end
    end

    context "valid file with one purchase line" do
      before(:each) do
        @import = Import.new(file_name: 'test.tab', content: IO.read(Rails.root.join('spec', 'fixtures', 'valid_one_line.tab')))
        @import.parse_file
      end

      it "creates a purchaser" do
        purchasers = Purchaser.all
        purchasers.size.should == 1
        purchasers.first.name.should == "Snake Plissken"
      end

      it "adds a new item" do
        items = Item.all
        items.size.should == 1
        items.first.description.should == "$10 off $20 of food"
        items.first.price.should == 10.0
      end

      it "adds a new purchase" do
        purchases = @import.purchases
        purchases.size.should == 1
        purchases.first.count.should == 2
        purchases.first.item_id.should_not be_nil
        purchases.first.purchaser_id.should_not be_nil
        purchases.first.import_id.should_not be_nil
      end

      it "adds a new merchant" do
        merchants = Merchant.all
        merchants.size.should == 1
        merchants.first.address.should == '987 Fake St'
        merchants.first.name.should == "Bob's Pizza"
      end
    end
  end
end
