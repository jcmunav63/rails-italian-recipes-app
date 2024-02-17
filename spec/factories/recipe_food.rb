FactoryBot.define do
  factory :recipe_food do
    quantity { 5 }
    association :recipe
    association :food
  end
end
