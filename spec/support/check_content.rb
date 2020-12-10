module CheckContent

  # 画面の必須項目が正常に描画されていること
  def check_required_content_for(post)
    expect(page).to have_content post.title
    expect(page).to have_content post.deadline.to_s.gsub('-', '/')
    expect(page).to have_content post.budget.to_s(:delimited)
  end

  # 画面の必須項目が正常に描画されていること
  def check_myPage_content_for(post)
    # expect(page).to have_content post.description
    # HACK:汚いからリファクタリングしたい
    i = 0
    reputation = ''
    while i < post_all_contents.reputation
      reputation += '★'
      i += 1
    end
    expect(all('.post-data__post-body').last.find('.post-reputation-front')).to have_content reputation

    priority = ''
    while i < post_all_contents.priority
      priority += '★'
      i += 1
    end
    expect(all('.post-data__post-body').last.find('.post-priority-front')).to have_content priority
  end

end