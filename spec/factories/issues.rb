FactoryGirl.define do
  factory :issue do
    sequence(:title) { |n| "Issue #{n}" }
    magazine "Graff Mags"
    address "123 Main St"
    city "Boston"
    state "MA"
    country "US"
    year "1993"
  end
end
