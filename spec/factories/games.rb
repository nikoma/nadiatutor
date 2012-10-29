# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    questions 1
    correct 1
    wrong 1
    points 1
    range_id 1
  end
end
