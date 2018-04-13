FactoryBot.define do
  factory :trip do
    sequence(:name) { |n| "Trip #{n}" }
  end
end