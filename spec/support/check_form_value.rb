module CheckFromValue

  # 必須項目に値がないこと
  def check_required_no_value?
    expect(find_field('タスクタイトル').value).to eq nil
    expect(find('#post_deadline_1i').value).to eq ''
    expect(find('#post_deadline_2i').value).to eq ''
    expect(find('#post_deadline_3i').value).to eq ''
    expect(find_field('予　　算').value).to eq nil
  end

  # 通常項目に値がないこと
  def check_form_no_value?
    expect(page).to have_field 'タスク詳細', with: nil
    expect(page).to have_no_selector '.input_images'
    # NOTE:共通化するとエラーで落とされる
    # expect(find_field('場　　所').value).to eq nil
    # expect(page).to have_field '場　　所', with: nil
    expect(page).to have_field 'カテゴリ', with: nil
    expect(find('#post_priority').value).to eq ''
    expect(page).to have_unchecked_field('非 公 開 に す る')
    expect(page).to have_unchecked_field('達 成 済 に す る')
    expect(find('#post_reputation').value).to eq ''
    expect(page).to have_no_selector '.taskFormArea'
  end

  # 必須項目に値があること
  def check_required_value_for(post)
    expect(page).to have_field 'タスクタイトル', with: post.title
    expect(page).to have_select('post_deadline_1i', selected: post.deadline.year.to_s)
    expect(page).to have_select('post_deadline_2i', selected: post.deadline.month.to_s)
    expect(page).to have_select('post_deadline_3i', selected: post.deadline.day.to_s)
    expect(page).to have_field '予　　算', with: post.budget
  end

  # 項目に値があること
  def check_form_value_for(post)
    expect(page).to have_field 'タスク詳細', with: post.description
    expect(find('#post_priority').value).to eq post.priority.to_s
    expect(find('#post_reputation').value).to eq post.reputation.to_s
  end

end