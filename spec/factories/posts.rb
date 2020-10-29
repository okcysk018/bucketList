FactoryBot.define do

  factory :post, class: Post do
    title       { Faker::Nation.nationality }
    deadline    {'2020-01-01'}
    budget      {1000}
    user
  end

  factory :post_eleven_images, class: Post do
    title       { Faker::Nation.nationality }
    deadline    {'2020-01-01'}
    budget      {1000}
    user
    after(:build) do |post|
      # carrierwaveの場合
      post.images << build_list(:image, 11)
    end
  end

  factory :post_ten_images, class: Post do
    title       { Faker::Nation.nationality }
    deadline    {'2020-01-01'}
    budget      {1000}
    user
    after(:build) do |post|
      # carrierwaveの場合
      post.images << build_list(:image, 10)
    end
  end

  factory :post_eleven_tasks, class: Post do
    title       { Faker::Nation.nationality }
    deadline    {'2020-01-01'}
    budget      {1000}
    user
    after(:build) do |post|
      post.tasks << build_list(:task, 11)
    end
  end

  factory :post_ten_tasks, class: Post do
    title       { Faker::Nation.nationality }
    deadline    {'2020-01-01'}
    budget      {1000}
    user
    after(:build) do |post|
      post.tasks << build_list(:task, 10)
    end
  end

end