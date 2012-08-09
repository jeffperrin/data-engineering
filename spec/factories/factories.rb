require 'factory_girl'

FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant #{n}" }
    address "123 My Way"
  end

  factory :item do
    sequence(:description) { |n| "Item #{n}" }
    merchant
    price 100.0
  end

  factory :purchaser do
    sequence(:name) { |n| "Purchaser #{n}" }
  end

  factory :purchase do
    item
    import
    count 1
  end

  factory :import do
    sequence(:file_name) { |n| "Import #{n}" }
    content "purchaser name"
  end
end