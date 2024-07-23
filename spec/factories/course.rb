require 'faker'

FactoryGirl.define do
  factory :course do
    name { Faker::Educator.unique.course }
    description { Faker::Lorem.sentence }
    duration { Faker::Number.non_zero_digit }
    fees { Faker::Commerce.price * 100 }

    transient do
      tutors_count { 2 }
    end

    after(:create) do |course, evaluator|
      create_list(:tutor, evaluator.tutors_count, course: course)
    end

  end
end

FactoryGirl.define do
  factory :tutor do
      name { Faker::Name.unique.name_with_middle }
      email { Faker::Internet.unique.email(domain: 'test.com') }
      age { Faker::Number.non_zero_digit }
      expertise { Faker::Educator.subject }
      course
  end
end