FactoryBot.define do

  factory :post do
    title       { Faker::Nation.nationality }
    deadline    {'2020-01-01'}
    budget      {1000}
    user
  end

end