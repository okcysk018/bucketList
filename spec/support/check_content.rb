module CheckViewContent

  # 画面の必須項目が正常に描画されていること
  def check_required_content_for(post)
    expect(page).to have_content post.title
    expect(page).to have_content post.deadline.to_s.gsub('-', '/')
    expect(page).to have_content post.budget.to_s(:delimited)
  end

  def check_show_content_for(post)
    expect(page).to have_content post.description
    expect(first('.post-info').find('.post-reputation-front')).to have_content check_content_star(post.reputation)
  end

  def check_search_content_for(post)
    expect(first('.card-body')).to have_content post.title
    expect(first('.card-body')).to have_content user.nickname
    # expect(page).to have_content post.title
    # expect(page).to have_content user.nickname
    expect(first('.card-body').find('.post-reputation-front')).to have_content check_content_star(post_all_contents.reputation)
  end

  # マイページの項目が正常に描画されていること
  def check_myPage_content_for(post)
    expect(all('.post-data__post-body').last.find('.post-reputation-front')).to have_content check_content_star(post.reputation)
    expect(all('.post-data__post-body').last.find('.post-priority-front')).to have_content check_content_star(post.priority)
  end

  def check_myPage_first_content_for(post)
    expect(first('.post-data__post-body').find('.post-reputation-front')).to have_content check_content_star(post.reputation)
    expect(first('.post-data__post-body').find('.post-priority-front')).to have_content check_content_star(post.priority)
  end

  protected
  def check_content_star(stars)
    i = 0
    star = ''
    while i < stars
      star += '★'
      i += 1
    end
    return star
  end

end