Given /^I have a valid data file$/ do
  $file = Rails.root.join('features', 'support', 'valid_import.tab')
end

When /^I import the file$/ do
  visit root_path
  attach_file("import_import_file", $file.to_s)
  click_on "Import"
end

Then /^I should see a confirmation message$/ do
  page.should have_content("Purchases totalling 95.0 of gross revenue were successfully imported")
end

Then /^the data from the file should be in our database$/ do
  Import.count.should == 1
  Item.count.should > 0
  Purchaser.count.should > 0
  Merchant.count.should > 0
  Purchase.count.should > 0
end

When /^I import an invalid file$/ do
  visit root_path
  click_on "Import"
end

Then /^I should see an error message$/ do
  page.should have_content("must be fixed before continuing")
end

Then /^no new data should be in our database$/ do
  Import.count.should == 0
end
