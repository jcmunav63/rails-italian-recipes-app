FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "Recipe #{n}" }
    preparation_time { 25 }
    cooking_time { 25 }
    description { 'Delicious recipe' }
    public { false }
    association :user
  end
end
