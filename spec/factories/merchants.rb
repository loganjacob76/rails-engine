FactoryBot.define do
  factory :merchant do
    sequence(:name) { |n| "#{Faker::Beer.brand}#{n}" }
  end
end