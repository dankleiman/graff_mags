FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example_#{n}@graffmags.com" }
    password "12345678"
  end
end
