FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "Delicious Recipe #{n}" }
    preparation_time { 20 }
    cooking_time { 30 }
    description { 'This is a delicious recipe description.' }
    public { false }
    association :user
  end
end
