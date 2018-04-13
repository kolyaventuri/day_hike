FactoryBot.define do
  factory :trail do
    sequence(:name)    { |n| "Trip #{n}" }
    sequence(:address) { |n| "Address #{n}" }
    length 5
  end
end