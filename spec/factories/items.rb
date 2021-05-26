FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "#{Faker::Beer.name}#{n}" }
    description { Faker::Lorem.sentence(word_count: 3) }
    unit_price { Faker::Number.number(digits: 5) }

    association :merchant, factory: :merchant
  end
end
