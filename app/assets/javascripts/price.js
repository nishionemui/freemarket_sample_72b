$(function(){
  $('#sell-price').on('keyup', function(){
    var price = $(this).val();
    let tax = $('#sell-price').val();
    if (price >= 300 && price <= 9999999) {
      $('#furima_fee').text(Math.ceil(tax * 0.1) + "円");
      $('#seller_gain').text(Math.ceil(tax - (tax * 0.1)) + "円");
    } else {
      $('#furima_fee').text('--')
      $('#seller_gain').text('--')
    }
  });
});

