# カテゴリー
# Category.create(name: "グルメ")
# Category.create(name: "住処")
# Category.create(name: "人生計画")
# Category.create(name: "アウトドア")
# Category.create(name: "インドア")
# Category.create(name: "エンターテイメント")
# Category.create(name: "スポーツ")
# Category.create(name: "恋愛")
# Category.create(name: "健康")
# Category.create(name: "旅行")
# Category.create(name: "仕事")
# Category.create(name: "スキル")
# Category.create(name: "初体験")

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
