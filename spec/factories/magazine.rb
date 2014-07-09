FactoryGirl.define do
  factory :magazine do
    sequence(:title) { |n| "Graff #{n} Mags" }
    alternate_titles "GraffMags"
  end
end
