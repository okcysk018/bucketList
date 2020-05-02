# 初期ユーザ
User.create!(
  email: 'test@test.com',
  nickname: 'test_user',
  password: 'tttttttt'
)

# 初期データ
Post.create!(
  title: '初期データ',
  description: '初期データ',
  place: nil,
  deadline: nil,
  budget: 1000,
  reputation: nil,
  priority: nil,
  done_flag: false,
  private_flag: false,
  user_id: 1
)

# カテゴリータグ
category = [
  "グルメ",
  "住処",
  "人生計画",
  "アウトドア",
  "インドア",
  "エンターテイメント",
  "スポーツ",
  "恋愛",
  "健康",
  "旅行",
  "仕事",
  "スキル",
  "初体験"
]

category.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
  ActsAsTaggableOn::Tagging.new(
    :tag_id => category.index(tag) + 1,
    :taggable_type => "Post",
    :taggable_id => 1,
    :context => "categories"
  ).save
end
