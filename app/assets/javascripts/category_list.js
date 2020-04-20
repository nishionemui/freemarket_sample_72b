$(function(){
  $('.categoty-link').hover(function(){
    $(".category-list", this).show();
  }, function(){
      $(".category-list",this).hide();
  });
  $('.parent_list').hover(function() {
    var category_obj = $(this).children('.child_top');
    category_obj.show();
  }, function() {
    $(this).children('.child_top').hide();
  });

  $('.child_list').hover(function() {
    var category_obj = $(this).children('.gchild_top');
    category_obj.show();
  }, function() {
    $(this).children('.gchild_top').hide();
  });
});