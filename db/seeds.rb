# 初期ユーザ
User.create!([
              {
                email: 'test@email.com',
                nickname: 'test_user',
                password: 'tttttttt'
              },
              {
                email: 'post@email.com',
                nickname: 'post_user',
                password: 'pppppppp'
              },
              {
                email: 'show@email.com',
                nickname: 'show_user',
                password: 'ssssssss'
              }
            ])

# 初期投稿データ
Post.create!([
              {
                title: '初期データ',
                description: '初期データ',
                deadline: '2020-01-01',
                budget: 1000,
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
                user_id: 2
              },
              {
                title: '世界一周',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000000,
                reputation: 5,
                priority: 5,
                user_id: 2
              },
              {
                title: '結婚',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                reputation: 5,
                priority: 5,
                user_id: 2
              },
              {
                title: 'スカイダイビング',
                description: '初期データ',
                deadline: '2025-12-31',
                budget: 50000,
                reputation: 3,
                priority: 3,
                user_id: 2
              },
              {
                title: '乗馬',
                description: '初期データ',
                deadline: '2025-12-31',
                budget: 10000,
                reputation: 2,
                priority: 2,
                user_id: 2
              },
              {
                title: 'キリマンジャロ登頂',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000000,
                reputation: 1,
                priority: 1,
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
                address: 'アメリカ合衆国 ネバダ州 ラスベガス',
                place_id: 'ChIJ0X31pIK3voARo3mz1ebVzDo',
                user_id: 2
              },
              {
                title: 'スキューバダイビング',
                description: '初期データ場所',
                deadline: '2030-12-31',
                budget: 100000,
                address: '日本、沖縄県那覇市',
                place_id: 'ChIJi7WmQXFp5TQRmF5YFvav2Cw',
                user_id: 2
              },
              {
                title: 'スペイン旅行',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                done_flag: true,
                user_id: 2
              },
              {
                title: 'ラグビー観戦',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'ダンス習得',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: 'バンジージャンプ挑戦',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: 'ルービックキューブ全面揃える',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000,
                user_id: 2
              },
              {
                title: 'バク転習得',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: 'イタリア旅行',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'エジプト旅行',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'プログラミング習得',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'サーフィン',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                done_flag: true,
                user_id: 2
              },
              {
                title: 'ペットを飼う',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: 'パンケーキ食べたい',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000,
                user_id: 2
              },
              {
                title: 'シュールストレミングに挑戦',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000,
                user_id: 2
              },
              {
                title: 'ドリアンを食べる',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: '引っ越し',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 500000,
                user_id: 2
              },
              {
                title: '高層マンションに住む',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000000,
                user_id: 2
              },
              {
                title: '転職する',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: 'ディベートスキルを磨く',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: '副業する',
                description: '初期データ',
                deadline: '2020-12-31',
                budget: 0,
                private_flag: true,
                user_id: 2
              },
              {
                title: '昇進',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: '相撲観戦',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                done_flag: true,
                user_id: 2
              },
              {
                title: '南極に行く',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000000,
                user_id: 2
              },
              {
                title: '一目惚れする',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: '活火山の噴火口を見る',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'ボランティアをする',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: 'オリンピック観戦',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: 'ポーカーの大会に出場',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: '水切りできるようになる',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: '太く短く生きる',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: '農業体験',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: '一生分の夜遊びを1日でする',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'バーで初対面の美女にカクテルを奢る',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'バイクツーリングする',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: 'アメリカ横断',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 500000,
                user_id: 2
              },
              {
                title: '外国語を学ぶ',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: '自己投資する',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 10000,
                user_id: 2
              },
              {
                title: 'トルコ旅行',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: 'インド旅行',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                address: "インド ウッタル・プラデーシュ Mudila Khurd, ガンジス川",
                place_id: "ChIJS8aQvmfnljkRJYmLSmqmC_8",
                reputation: 3,
                done_flag: true,
                user_id: 2
              },
              {
                title: '感謝の手紙を書く',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 0,
                user_id: 2
              },
              {
                title: 'トライアスロン挑戦',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: '飛行機を操縦する',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 100000,
                user_id: 2
              },
              {
                title: '月に行く',
                description: '初期データ',
                deadline: '2030-12-31',
                budget: 1000000,
                user_id: 2
              }
             ])

# 初期データサブタスク
Task.create!([
              {
                title: '初期データサブタスク①',
                post_id: 2
              },
              {
                title: '初期データサブタスク②',
                post_id: 2
              },
              {
                title: '初期データサブタスク③',
                post_id: 2
              },
              {
                title: 'カジノ',
                post_id: 10
              },
              {
                title: 'グランドキャニオン',
                post_id: 10
              },
              {
                title: 'ソルトレイクシティ',
                post_id: 10
              },
              {
                title: 'ベラージオ噴水',
                post_id: 10
              }
            ])

# カテゴリータグ
category = [
  "グルメ",
  "住処",
  "人生",
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
  ActsAsTaggableOn::Tag.new(name: tag).save
  ActsAsTaggableOn::Tagging.new(
    tag_id: category.index(tag) + 1,
    taggable_type: "Post",
    taggable_id: 2,
    context: "categories"
  ).save
end

tags_relatedPostIds = [
  [23, 24],  # "グルメ",
  [26, 27],  # "住処",
  [4, 5, 22, 40, 42, 43, 47, 50], # "人生",
  [6, 7, 8, 15, 21, 35, 41, 44, 51, 52], # "アウトドア",
  [3, 14, 16, 20, 38, 46], # "インドア",
  [13, 14, 32, 37, 38, 39, 42, 51], # "エンターテイメント",
  [3, 7, 8, 11, 13, 14, 17, 21, 32, 37, 51], # "スポーツ",
  [5, 22, 50],  # "愛",
  [3, 40, 51],  # "健康",
  [4, 8, 9, 10, 12, 18, 19, 33, 44, 45, 48, 49, 53], # "旅行",
  [28, 29, 30, 31], # "仕事",
  [14, 16, 20, 29, 46, 47, 52] # "スキル",
]

tags_relatedPostIds.each_with_index do |relatedPostIds, i|
  idx = i + 1
  relatedPostIds.each do |id|
    ActsAsTaggableOn::Tagging.create!(
      taggable_id: id,
      tag_id: idx,
      taggable_type: "Post",
      context: "categories"
    )
  end
end

Image.create!([
                {
                  image:  open("#{Rails.root}/db/images/1-1.Apple.jpeg"),
                  post_id: 2
                },
                {
                  image:  open("#{Rails.root}/db/images/1-2.gollira.jpeg"),
                  post_id: 2
                },
                {
                  image:  open("#{Rails.root}/db/images/1-3.rap.png"),
                  post_id: 2
                },
                {
                  image:  open("#{Rails.root}/db/images/1-4.pants.png"),
                  post_id: 2
                },
                {
                  image:  open("#{Rails.root}/db/images/1-5.noImage.jpg"),
                  post_id: 2
                }
              ])

# HACK: ハードコーディング避けたい
default_image_file = ["6.muscle.jpeg", "7.world.jpeg", "8.marriage.jpeg", "9.skyDiving.jpeg", "10.horseRide.jpeg", "11.killimanjaro.jpeg", "12.cuba.jpeg", "13.vegas.jpeg", "14.sucuba.jpeg", "15.spain.jpeg", "16.rugby.jpeg", "17.dance.jpeg", "18.bungee.jpeg", "19.cube.jpeg", "20.backflip.jpeg", "21.Italia.jpeg", "22.Egypt.jpeg", "23.programing.jpeg", "24.surfing.jpeg", "25.pet.jpeg", "26.breadCake.jpeg", "27.Surrealism.jpeg", "28.durian.jpeg", "29.moving.jpeg", "30.skyscrapers.jpeg", "31.jobChange.jpeg", "32.debate.jpeg", "33.freelancer.jpeg", "34.promotion.jpeg", "35.sumo.jpeg", "36.Atlantic.jpeg", "37.love_at_first_sight.jpeg", "38.volcano.jpeg", "39.volunteer.jpeg", "40.Olympic.jpeg", "41.poker.jpeg", "42.DucksAndDrakes.jpeg", "43.life.jpeg", "44.agriculture.jpeg", "45.nightlife.jpeg", "46.cocktail.jpeg", "47.bike.jpeg", "48.across_America.jpeg", "49.languages.jpeg", "50.investMyLife.jpeg", "51.Turkey.jpeg", "52.India.jpeg", "53.letter.jpeg", "54.triathlon.jpeg", "55.pilot.jpeg", "56.moon.jpeg"]

default_image_file.each.with_index(3) do |name, i|
  Image.create!(
    image:  open("#{Rails.root}/db/images/#{i}-#{name}"),
    post_id: i
  )
end
