# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    number_a 1
    number_b 1
    correct_result 1
    your_result 1
    game_id 1
  end
end
