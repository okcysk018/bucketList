$(document).on('turbolinks:load', function(){
  // サブタスクのフォームを生成する関数
  // TODO:オプションの省略
  const buildTaskForm = (index)=> {
    const html = `<div data-index="${index}" class="taskForm_group">
                    <input name="post[tasks_attributes][${index}][done_flag]" type="hidden" value="0">
                    <input class="post-tasks-done" type="checkbox" value="1" name="post[tasks_attributes][${index}][done_flag]" id="post_tasks_attributes_${index}_done_flag">
                    <input placeholder="サブタスクタイトルを入力してください" required="required" class="post-tasks-title" type="text" name="post[tasks_attributes][${index}][title]" id="post_tasks_attributes_${index}_title">
                    <select id="post_tasks_attributes_${index}_deadline_1i" name="post[tasks_attributes][${index}][deadline(1i)]">
                      <option value="">---</option>
                      <option value="2020">2020</option>
                      <option value="2021">2021</option>
                      <option value="2022">2022</option>
                      <option value="2023">2023</option>
                      <option value="2024">2024</option>
                      <option value="2025">2025</option>
                      <option value="2026">2026</option>
                      <option value="2027">2027</option>
                      <option value="2028">2028</option>
                      <option value="2029">2029</option>
                      <option value="2030">2030</option>
                      <option value="2031">2031</option>
                      <option value="2032">2032</option>
                      <option value="2033">2033</option>
                      <option value="2034">2034</option>
                      <option value="2035">2035</option>
                      <option value="2036">2036</option>
                      <option value="2037">2037</option>
                      <option value="2038">2038</option>
                      <option value="2039">2039</option>
                      <option value="2040">2040</option>
                      <option value="2041">2041</option>
                      <option value="2042">2042</option>
                      <option value="2043">2043</option>
                      <option value="2044">2044</option>
                      <option value="2045">2045</option>
                      <option value="2046">2046</option>
                      <option value="2047">2047</option>
                      <option value="2048">2048</option>
                      <option value="2049">2049</option>
                      <option value="2050">2050</option>
                    </select>
                      年
                    <select id="post_tasks_attributes_${index}_deadline_2i" name="post[tasks_attributes][${index}][deadline(2i)]">
                      <option value="">---</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                    </select>
                      月
                    <select id="post_tasks_attributes_${index}_deadline_3i" name="post[tasks_attributes][${index}][deadline(3i)]">
                      <option value="">---</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="13">13</option>
                      <option value="14">14</option>
                      <option value="15">15</option>
                      <option value="16">16</option>
                      <option value="17">17</option>
                      <option value="18">18</option>
                      <option value="19">19</option>
                      <option value="20">20</option>
                      <option value="21">21</option>
                      <option value="22">22</option>
                      <option value="23">23</option>
                      <option value="24">24</option>
                      <option value="25">25</option>
                      <option value="26">26</option>
                      <option value="27">27</option>
                      <option value="28">28</option>
                      <option value="29">29</option>
                      <option value="30">30</option>
                      <option value="31">31</option>
                    </select>
                      日
                    <span data-index="${index}" class="deleteButton-task btn btn-light">
                      <i class="fas fa-backspace"></i>
                      削除
                    </span>
                  </div>`;
    return html;
  }

  // サブタスクリストのフォームを生成する関数
  // TODO:進行率の表示
  function buildTasklistForm(){
    // const html = `<div class="formContent__progressBar">
    //                 <div class="tasklist-progress-percentage">0%</div>
    //                 <div class="tasklist-progressBar progress">
    //                   <div class="tasklist-progressBar-current progress-bar-striped bg-primary" style="width:50%"></div>
    //                 </div>
    //               </div>
    const html = `<div class="taskFormArea">
                  </div>
                  <span class="addButton-task btn btn-light">
                    <i class="fa fa-plus"></i>
                    タスクを追加
                  </span>`;
    return html;
  }


  function buildTasklistDeleteBtn(){
    const html = `<span class="deleteButton-tasklist btn btn-light">
                    <i class="fas fa-trash-alt"></i>
                    タスクリストを削除
                  </span>`
    return html;
  }

  function buildTasklistOpenBtn(){
    const html = `<span class="openButton-tasklist btn btn-light">
                    <i class="fa fa-plus"></i>
                    タスクリストを追加
                  </span>`
    return html;
  }

  // サブタスクの識別番号の初期値設定
  let setIndex = $('.taskForm_group').length;
  // サブタスクの上限数
  const taskLimit = 3

  // $('.hidden-destroy').hide();

  // 編集画面描画時サブタスク上限数を超えている際は追加ボタンのクリックと選択を無効化する
  if ($('.taskForm_group').length >= taskLimit) {
    $('.addButton-task').css({'pointer-events':'none'});
    $('.addButton-task').removeClass('btn-light');
    $('.addButton-task').addClass('btn-danger');
  }

  // タスク追加ボタン押下時の関数
  $('.tasklist').on('click', '.addButton-task', function() {

    $('.taskFormArea').append(buildTaskForm(setIndex));
    // サブタスク上限数を超えた際は追加ボタンのクリックと選択を無効化する
    if ($('.taskForm_group').length >= taskLimit) {
      $(this).css({'pointer-events':'none'});
      $(this).removeClass('btn-light');
      $(this).addClass('btn-danger');
    }
    // setIndexを加算
    setIndex += 1
  });
  // 削除ボタンの設定
  $('.tasklist').on('click', '.deleteButton-task', function() {
    const targetIndex = $(this).data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    // サブタスクが上限以内の場合、削除ボタン非活性を解除する
    if ($('.taskForm_group').length <= taskLimit) {
      $(".addButton-task").css('pointer-events', '');
      $(".addButton-task").removeClass('btn-danger');
      $(".addButton-task").addClass('btn-light');
    }

    // TODO:フォームが存在しない場合、タスク追加ボタンと進行バーを削除
    // if ($('.taskForm_group').length == 0) {
    //   $('.formContent__titleBar__titleMemu__menuOptions').append(buildTasklistOpenBtn);
    //   $('.addButton-task').remove();
    //   $('.formContent__progressBar').remove();
    //   $('taskFormArea').addClass('.hidden-edit');
    //   $('.taskFormArea').removeClass();
    // }
  });
  // タスクリスト追加ボタンの設定
  $('.tasklist').on('click', '.openButton-tasklist', function() {
    $('.tasklist').append(buildTasklistForm);
    // $(this).parent().append(buildTasklistDeleteBtn);
    $(this).remove();
  });

  // TODO:タスクリスト削除ボタンの設定
  // $('.tasklist').on('click', '.deleteButton-tasklist', function() {
  //   $('.taskForm_group').remove();
  //   $(this).parent().append(buildTasklistOpenBtn);
  //   $(this).remove();
  // });

});
