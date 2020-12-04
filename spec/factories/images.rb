FactoryBot.define do
  factory :image do
    image { File.open("#{Rails.root}/app/assets/images/noImage.jpg") }
  end
end