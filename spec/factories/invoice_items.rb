FactoryBot.define do
  factory :invoice_item do
    quantity { rand(1..10) }
    unit_price { Faker::Number.number(digits: 5) }

    association :item, factory: :item
    association :invoice, factory: :invoice
  end
end
