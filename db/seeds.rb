# 初期ユーザ
User.create!(
  email: 'test@email.com',
  nickname: 'test_user',
  password: 'tttttttt'
)
User.create!(
  email: 'post@email.com',
  nickname: 'post_user',
  password: 'pppppppp'
)
User.create!(
  email: 'show@email.com',
  nickname: 'show_user',
  password: 'ssssssss'
)

# 初期投稿データ
Post.create!(
  [
    {
      title: '初期データ',
      description: '初期データ',
      deadline: '2020-01-01',
      budget: 1000,
      private_flag: false,
      user_id: 1
    },
    {
      title: '非公開初期データ',
      description: '非公開達成済',
      deadline: '2020-01-01',
      budget: 1000,
      reputation: 5,
      priority: 5,
      done_flag: true,
      private_flag: true,
      user_id: 1
    },
    {
      title: '筋トレ',
      description: '初期データ',
      deadline: '2025-12-31',
      budget: 10000,
      reputation: 4,
      priority: 4,
      private_flag: false,
      user_id: 2
    },
    {
      title: '世界一周',
      description: '初期データ',
      deadline: '2030-12-31',
      budget: 1000000,
      reputation: 5,
      priority: 5,
      private_flag: false,
      user_id: 2
    },
    {
      title: '結婚',
      description: '初期データ',
      deadline: '2030-12-31',
      budget: 0,
      reputation: 3,
      priority: 5,
      private_flag: false,
      user_id: 2
    },
    {
      title: 'スカイダイビング',
      description: '初期データ',
      deadline: '2025-12-31',
      budget: 50000,
      reputation: 3,
      priority: 3,
      private_flag: false,
      user_id: 2
    },
    {
      title: '乗馬',
      description: '初期データ',
      deadline: '2025-12-31',
      budget: 10000,
      reputation: 2,
      priority: 2,
      private_flag: false,
      user_id: 2
    },
    {
      title: 'キリマンジャロ登頂',
      description: '初期データ',
      deadline: '2030-12-31',
      budget: 1000000,
      reputation: 1,
      priority: 1,
      private_flag: false,
      user_id: 2
    },
    {
      title: 'キューバ旅行',
      description: '初期データ',
      deadline: '2030-12-31',
      budget: 100000,
      private_flag: true,
      user_id: 2
    },
    {
      title: 'ラスベガス旅行',
      description: '初期データ複数タスク',
      deadline: '2030-12-31',
      budget: 100000,
      address: 'ラスベガス',
      latitude: 36.1673,
      longitude: -115.149,
      private_flag: false,
      user_id: 2
    },
    {
      title: 'スキューバダイビング',
      description: '初期データ場所',
      deadline: '2030-12-31',
      budget: 100000,
      address: '沖縄',
      latitude: 26.3344,
      longitude: 127.806,
      private_flag: false,
      user_id: 2
    },
    {
      title: 'スペイン旅行',
      description: '初期データ',
      deadline: '2030-12-31',
      budget: 100000,
      private_flag: false,
      done_flag: true,
      user_id: 2
    },
    {
      title: 'ラグビー',
      description: '初期データ',
      deadline: '2030-12-31',
      budget: 100000,
      private_flag: false,
      user_id: 2
    }
  ]
)

# 初期データサブタスク
Task.create!([
  {
    title: 'カジノ',
    post_id: 10,
  },
  {
    title: 'グランドキャニオン',
    post_id: 10,
  },
  {
    title: 'ソルトレイクシティ',
    post_id: 10,
  },
  {
    title: 'ベラージオ噴水',
    post_id: 10,
  },
])

# カテゴリータグ
category = [
  "グルメ",
  "住処",
  "人生計画",
  "アウトドア",
  "インドア",
  "エンターテイメント",
  "スポーツ",
  "愛",
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
    :taggable_id => 2,
    :context => "categories"
  ).save
end

# TODO:省略可？
ActsAsTaggableOn::Tagging.create!([
  {
    :tag_id => 5,
    :taggable_type => "Post",
    :taggable_id => 3,
    :context => "categories"
  },
  {
    :tag_id => 9,
    :taggable_type => "Post",
    :taggable_id => 3,
    :context => "categories"
  },
  {
    tag_id: 3,
    taggable_type: "Post",
    taggable_id: 4,
    context: "categories"
  },
  {
    tag_id: 10,
    taggable_type: "Post",
    taggable_id: 4,
    context: "categories"
  },
  {
    tag_id: 3,
    taggable_type: "Post",
    taggable_id: 5,
    context: "categories"
  },
  {
    tag_id: 8,
    taggable_type: "Post",
    taggable_id: 5,
    context: "categories"
  },
  {
    tag_id: 4,
    taggable_type: "Post",
    taggable_id: 6,
    context: "categories"
  },
  {
    tag_id: 6,
    taggable_type: "Post",
    taggable_id: 6,
    context: "categories"
  },
  {
    tag_id: 13,
    taggable_type: "Post",
    taggable_id: 6,
    context: "categories"
  },
  {
    tag_id: 13,
    taggable_type: "Post",
    taggable_id: 7,
    context: "categories"
  },
  {
    tag_id: 4,
    taggable_type: "Post",
    taggable_id: 7,
    context: "categories"
  },
  {
    tag_id: 6,
    taggable_type: "Post",
    taggable_id: 7,
    context: "categories"
  },
  {
    tag_id: 7,
    taggable_type: "Post",
    taggable_id: 7,
    context: "categories"
  },
  {
    tag_id: 12,
    taggable_type: "Post",
    taggable_id: 7,
    context: "categories"
  },
])

Image.create!([
  {
    image:  open("#{Rails.root}/db/images/1.Apple.jpeg"),
    post_id: 2,
  },
  {
    image:  open("#{Rails.root}/db/images/2.gollira.jpeg"),
    post_id: 2,
  },
  {
    image:  open("#{Rails.root}/db/images/3.rap.png"),
    post_id: 2,
  },
  {
    image:  open("#{Rails.root}/db/images/4.pants.png"),
    post_id: 2,
  },
  {
    image:  open("#{Rails.root}/db/images/5.noImage.jpg"),
    post_id: 2,
  },
  {
    image:  open("#{Rails.root}/db/images/6.muscle.jpeg"),
    post_id: 3,
  },
  {
    image:  open("#{Rails.root}/db/images/7.world.jpeg"),
    post_id: 4,
  },
  {
    image:  open("#{Rails.root}/db/images/8.marriage.jpeg"),
    post_id: 5,
  },
  {
    image:  open("#{Rails.root}/db/images/9.skyDiving.jpeg"),
    post_id: 6,
  },
  {
    image:  open("#{Rails.root}/db/images/10.horseRide.jpeg"),
    post_id: 7,
  },

  {
    image:  open("#{Rails.root}/db/images/11.killimanjaro.jpeg"),
    post_id: 8,
  },
  {
    image:  open("#{Rails.root}/db/images/12.cuba.jpeg"),
    post_id: 9,
  },
  {
    image:  open("#{Rails.root}/db/images/13.vegas.jpeg"),
    post_id: 10,
  },
  {
    image:  open("#{Rails.root}/db/images/14.sucuba.jpeg"),
    post_id: 11,
  },
  {
    image:  open("#{Rails.root}/db/images/15.spain.jpeg"),
    post_id: 12,
  },
  {
    image:  open("#{Rails.root}/db/images/16.rugby.jpeg"),
    post_id: 13,
  },
])
