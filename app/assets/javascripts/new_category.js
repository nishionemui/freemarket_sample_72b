// $(function(){
//   // カテゴリーセレクトボックスのオプションを作成
//   function appendOption(category){
//     var html = `<option value="${category.main_name}" data-category="${category.id}">${category.main_name}</option>`;
//     return html;
//   }
//   // 子カテゴリーの表示作成
//   function appendChidrenBox(insertHTML){
//     var childSelectHtml = '';
//     childSelectHtml = `<div class='select-wrap__added' id= 'children_wrapper'>
//                         <div class='select-wrap__box'>
//                         <select class="select-wrap__box--select" id="child_category" name="">
//                           <option value="選択して下さい" data-category="選択して下さい">選択して下さい</option>
//                           ${insertHTML}
//                         <select>
//                         <i class='fas fa-angle-down'></i>
//                         </div>
//                       </div>`;
//     $('.product-detail').append(childSelectHtml);
//   }
//   // 孫カテゴリーの表示作成
//   function appendGrandchidrenBox(insertHTML){
//     var grandchildSelectHtml = '';
//     grandchildSelectHtml = `<div class='select-wrap__added' id= 'grandchildren_wrapper'>
//                               <div class='select-wrap__box'>
//                               <select class='select-wrap__box--select' id="grandchild_category" name="product[category_id]">
//                                 <option value="選択して下さい" data-category="選択して下さい">選択して下さい</option>
//                                 ${insertHTML}
//                               </select>
//                               <i class='fas fa-angle-down'></i>
//                               </div>
//                             </div>`;
//     $('.product-detail').append(grandchildSelectHtml);
//   }
//   // 親カテゴリー選択後のイベント
//   $('#parent_category').on('change', function(){
//     var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
//     if (parentCategory != "選択して下さい"){ //親カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: 'get_category_children',
//         type: 'GET',
//         data: { parent_main_name: parentCategory },
//         dataType: 'json'
//       })
//       .done(function(children){
//         $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
//         $('#grandchildren_wrapper').remove();
//         $('#size_wrapper').remove();
//         $('#brand_wrapper').remove();
//         var insertHTML = '';
//         children.forEach(function(child){
//           insertHTML += appendOption(child);
//         });
//         appendChidrenBox(insertHTML);
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
//       $('#grandchildren_wrapper').remove();
//       $('#size_wrapper').remove();
//       $('#brand_wrapper').remove();
//     }
//   });
//   // 子カテゴリー選択後のイベント
//   $('.product-detail').on('change', '#child_category', function(){
//     var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
//     if (childId != "選択して下さい"){ //子カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: 'get_category_grandchildren',
//         type: 'GET',
//         data: { child_id: childId },
//         dataType: 'json'
//       })
//       .done(function(grandchildren){
//         if (grandchildren.length != 0) {
//           $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
//           $('#size_wrapper').remove();
//           $('#brand_wrapper').remove();
//           var insertHTML = '';
//           grandchildren.forEach(function(grandchild){
//             insertHTML += appendOption(grandchild);
//           });
//           appendGrandchidrenBox(insertHTML);
//         }
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
//       $('#size_wrapper').remove();
//       $('#brand_wrapper').remove();
//     }
//   });
// });


$(function(){
  let buildPrompt = `<option value>選択して下さい</option>`
  let buildHtmlOption = function(parent) {
    let option = `<option value ="${parent.id}">${parent.main_name}</option>`
    return option
  }
  $('#parent').change(function() {
    let parent_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/products/products/new/mid_category',
      data: {big_category_id: parent_id},
      dataType: 'json'
    })
    .done(function(parent) {
      $('.child').css('display', 'block');
      $('#child').empty();
      $('.grand_child').css('display', 'none');
      $('#child').append(buildPrompt);

      parent.forEach(function(child) {
        var html_option = buildHtmlOption(child);
        $('#child').append(html_option);
      });
    })
    .fail(function() {
      alert('カテゴリー取得に失敗しました')
    });
  });

  $(this).on("change", "#child", function() {
    let parent_id = $("#parent").val();
    let child_id = $("#child").val();

    $.ajax({
        type: 'GET',
        url: '/products/products/new/small_category',
        data: {
          big_category_id: parent_id,
          mid_category_id: child_id
        },
        dataType: 'json'
    })
    .done(function(parent) {
      $('.grand_child').css('display', 'block');
      $('#grand_child').empty();
      $('#grand_child').append(buildPrompt);

      parent.forEach(function(child) {
        var html_option = buildHtmlOption(child);
        $('#grand_child').append(html_option);
      });
    })
  });
});



