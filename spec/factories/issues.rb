FactoryGirl.define do
  factory :issue do
    sequence(:title) { |n| "Issue #{n}" }
    magazine "Graff Mags"
    address "123 Main St"
    city "Boston"
    state "MA"
    country "US"
    cover_image "http://graffmags.com/wp-content/uploads/2011/12/TuffCity3_01_lg-540x810.jpg"
    year "1993"
  end
end
