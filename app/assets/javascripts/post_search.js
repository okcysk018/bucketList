// WARN:require_treeの読込順によるpost_search.js読込エラー回避のためapplication.jsで直接指定
$(document).on('turbolinks:load', function(){

  $('select[name=sort_order]').change(function() {

    // 選択したoptionタグのvalue属性を取得する
    var this_value = $(this).val();
    // value属性の値により、ページ遷移先の分岐
    if (this_value == "budget_asc") {
      html = "&sort=budget+asc"
    } else if (this_value == "budget_desc") {
      html = "&sort=budget+desc"
    } else if (this_value == "deadline_asc") {
      html = "&sort=deadline+asc"
    } else if (this_value == "deadline_desc") {
      html = "&sort=deadline+desc"
    } else if (this_value == "created_at_asc") {
      html = "&sort=created_at+asc"
    } else if (this_value == "created_at_desc") {
      html = "&sort=created_at+desc"
    } else if (this_value == "reputation_asc") {
      html = "&sort=reputation+asc"
    } else if (this_value == "reputation_desc") {
      html = "&sort=reputation+desc"
    } else if (this_value == "priority_asc") {
      html = "&sort=priority+asc"
    } else if (this_value == "priority_desc") {
      html = "&sort=priority+desc"
    } else {
      html = ""
    };
    // 現在の表示ページ
    var current_html = window.location.href;
    // ソート機能の重複防止
    if (location['href'].match(/&sort=*.+/) != null) {
      var remove = location['href'].match(/&sort=*.+/)[0]
      var current_html = current_html.replace(remove, '')
    };
    // ページ遷移
    window.location.href = current_html + html
  });
  // ページ遷移後の挙動
  $(function () {
    if (location['href'].match(/&sort=*.+/) != null) {
      // option[selected: 'selected']を削除
      if ($('select option[selected=selected]')) {
        $('select option:first').prop('selected', false);
      }
      var selected_option = location['href'].match(/&sort=*.+/)[0].replace('&sort=', '');

      if(selected_option == "budget+asc") {
        var sort = 1
      } else if (selected_option == "budget+desc") {
        var sort = 2
      } else if (selected_option == "deadline+asc") {
        var sort = 3
      } else if (selected_option == "deadline+desc") {
        var sort = 4
      } else if (selected_option == "created_at+asc") {
        var sort = 5
      } else if (selected_option == "created_at+desc") {
        var sort = 6
      } else if (selected_option == "reputation+asc") {
        var sort = 7
      } else if (selected_option == "reputation+desc") {
        var sort = 8
      } else if (selected_option == "priority+asc") {
        var sort = 9
      } else if (selected_option == "priority+desc") {
        var sort = 10
      }

      var add_selected = $('select[name=sort_order]').children()[sort]
      $(add_selected).attr('selected', true)
    }
  });

});
