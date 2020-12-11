module InputFromValue

  # 必須項目に値を入力
  def input_required_value_for(post)
    fill_in 'タスクタイトル', with: post.title
    select post.deadline.year, from: 'post_deadline_1i'
    select post.deadline.month, from: 'post_deadline_2i'
    select post.deadline.day, from: 'post_deadline_3i'
    fill_in '予　　算', with: post.budget
  end

  def input_form_value_for(post)
    fill_in 'タスク詳細', with: post.description
    select "#{post.priority}", from: 'post_priority'
    # check '非 公 開 に す る'
    # check '達 成 済 に す る'
    select "#{post.reputation}", from: 'post_reputation'
    # TODO: 場所, カテゴリ, 画像, サブタスクを追加
  end

  # 必須項目に値を入力
  def update_required_value_for(post)
    fill_in 'タスクタイトル', with: post[:title]
    select post[:deadline].split(/-/, 3)[0].to_i, from: 'post_deadline_1i'
    select post[:deadline].split(/-/, 3)[1].to_i, from: 'post_deadline_2i'
    select post[:deadline].split(/-/, 3)[2].to_i, from: 'post_deadline_3i'
    fill_in '予　　算', with: post[:budget]
  end

  def update_form_value_for(post)
    fill_in 'タスク詳細', with: post[:description]
    select "#{post[:priority]}", from: 'post_priority'
    select "#{post[:reputation]}", from: 'post_reputation'
  end
end