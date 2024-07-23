require 'faker'

FactoryGirl.define do
  factory :course do
    name { Faker::Educator.course }
    description { Faker::Lorem.sentence }
    duration { Faker::Number.non_zero_digit }
    fees { Faker::Commerce.price }
  end
end