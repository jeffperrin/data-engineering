require 'spec_helper'

describe Import do
  describe "#valid?" do
    it "requires a file name" do
      subject.should have_errors_on(:file_name).with_message("can't be blank")
    end

    it "requires content" do
      subject.should have_errors_on(:content).with_message("can't be blank")
    end

    it "requires a valid header line" do
      subject.file_name = "test_file.tab"
      subject.content = "asdf asdf asdf"
      subject.should have_errors_on(:content).with_message("of 'test_file.tab' does not appear to be in the correct tab-delimitted format")
    end
  end


  describe "#parse_file" do
    context "header line exists without any data" do
      before(:each) do
        @import = Import.new(file_name: 'test.tab', content: 'purchaser name  item description  item price  purchase count  merchant address  merchant name')
        @import.parse_file
      end

      it "saves the import" do
        Import.count.should == 1
      end

      it "shouldn't have saved any additional data" do
        Item.count.should == 0
        Purchaser.count.should == 0
        Merchant.count.should == 0
        Purchase.count.should == 0
      end
    end
    context "valid file with one purchase line" do
      before(:each) do
        @import = Import.new(file_name: 'test.tab', content: IO.read(Rails.root.join('spec', 'fixtures', 'valid_one_line.tab')))
        @import.parse_file
      end

      it "saves the import" do
        Import.count.should == 1
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
        purchases = Purchase.all
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
