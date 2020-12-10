FactoryBot.define do

  factory :post, class: Post do
    title       { Faker::Nation.nationality }
    deadline    { Faker::Date.in_date_period }
    budget      { 1000 }
    user

    trait :title_length_max do
      title       { Faker::Base.regexify("[aあ]{40}") }
    end

    trait :title_length_over do
      title       { Faker::Lorem.characters(number: 41) }
    end

    trait :budget_length_max do
      budget      { 9999999 }
    end

    trait :budget_length_over do
      budget      { 10000000 }
    end

    trait :budget_zero do
      budget      { 0 }
    end

    trait :budget_minus do
      budget      { -1 }
    end

    trait :budget_decimal do
      budget      { Faker::Number.decimal(l_digits: 2) }
    end

    trait :with_address do
      address     { '日本、東京都東京' }
    end

    trait :with_placeId do
      place_id    { 'ChIJXSModoWLGGARILWiCfeu2M0' }
    end

    trait :with_reputation do
      reputation  {Faker::Number.between(from: 1, to: 5)}
    end

    trait :with_priority do
      priority    {Faker::Number.within(range: 1..5)}
    end

    trait :done_post do
      done_flag    { 1 }
    end

    trait :private_post do
      private_flag  { 1 }
    end

    trait :with_description do
      description  { Faker::Lorem.paragraph(sentence_count: 5) }
    end

    trait :post_ten_images do
      after(:build) do |post|
        # carrierwaveの場合
        post.images << build_list(:image, 10)
      end
    end

    trait :post_ten_tasks do
      after(:build) do |post|
        post.tasks << build_list(:task, 10)
      end
    end

    factory :post_eleven_images, class: Post do
      after(:build) do |post|
        # carrierwaveの場合
        post.images << build_list(:image, 11)
      end
    end

    factory :post_eleven_tasks, class: Post do
      after(:build) do |post|
        post.tasks << build_list(:task, 11)
      end
    end
  end
end