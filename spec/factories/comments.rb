FactoryBot.define do
  factory :comment do
    content { 'good place!' }
    association :post
    association :user
  end
end
