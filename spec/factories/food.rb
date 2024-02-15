FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Foodr #{n}" }
    measurement_unit { 'kg' }
    price { 2.5 }
    quantity { 2 }
    association :user
  end
end
