$('#sell-price').on('keyup', function(){
  var price = $(this).val();
  var furima_fee = Math.floor(price * 0.1)
  var seller_gain = price - mercari_fee

  if (price >= 300 && price <= 9999999) {
    $('#furima_fee').text('¥' + furima_fee.toLocaleString())
    $('#seller_gain').text('¥' + seller_gain.toLocaleString())
  } else {
    $('#furima_fee').text('--')
    $('#seller_gain').text('--')
  }
});

