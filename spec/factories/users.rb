FactoryBot.define do

  factory :user do
    email    { Faker::Internet.email }
    nickname { Faker::Name.name }
    password {'password'}
  end

end