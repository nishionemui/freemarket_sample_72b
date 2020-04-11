$(function(){
  $('.sub-icon').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    $('.top-image').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
  });
});