FactoryGirl.define do
  sequence :email do |n|
    "user#{n}#{n}#{n}#{n}#{n}#{n}@factory#{n}#{n}.com"
  end

  factory :user do
    password          "password1"
    email
  end
end
