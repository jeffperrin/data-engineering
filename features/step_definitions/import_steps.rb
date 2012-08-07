Given /^I have a valid data file$/ do
  $file = Rails.root.join('features', 'support', 'valid_import.tab')
end

When /^I import the file$/ do
  visit root_path
  attach_file("import_file", $file.to_s)
  click_on "Import"
end

Then /^I should see a confirmation message$/ do
  page.should have_content("The data file was successfully imported")
end

Then /^the data from the file should be in our database$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I have an invalid data file$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an error message$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^no new data should be in our database$/ do
  pending # express the regexp above with the code you wish you had
end
