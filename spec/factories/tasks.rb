FactoryBot.define do
  factory :task do
    title       { Faker::Nation.nationality }
  end
end