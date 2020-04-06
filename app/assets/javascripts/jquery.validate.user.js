jQuery(function($){
  $("#user_form").validate({
    rules : {
      "user[:nickname]": {
        required: true
      },
      "user[:first_name]": {
        required: true
      },
      "user[:last_name]": {
        required: true
      },
      "user[:first_name_read]": {
        required: true
      },	
      "user[:last_name_read]": {
        required: true
      },	
      "user[:email]": {
        required: true ,
        email: true,
        equalTo: "#email"
      },
      "user[:password]": {
        required: true,
        password: true
      },	
      "user[:password_confirmation]": {
        required: true,
        password: true
      }	,
      "user[:birthday]": {
        required: true
      }
    },
    messages: {
      "user[:nickname]": {
        required: "必須項目です。入力をお願いします。"
      },
      "user[:first_name]": {
        required:"必須項目です。入力をお願いします。"
      },
      "user[:last_name]": {
        required: "必須項目です。入力をお願いします。"
      },
      "user[:first_name_read]": {
        required: "必須項目です。入力をお願いします。"
      },	
      "user[:last_name_read]": {
        required: "必須項目です。入力をお願いします。"
      },	
      "user[:email]": {
        required: "必須項目です。入力をお願いします。",
        email: "Eメールの形式で入力して下さい。"
      },
      "user[:password]": {
        required: "必須項目です。入力をお願いします。"
      },	
      "user[:password_confirmation]": {
        required: "必須項目です。入力をお願いします。"
      }	,
      "user[:birthday]": {
        required: "必須項目です。入力をお願いします。"
      }
    },
    errorPlacement: function(error, element) {
      if(element.attr("name")=="CheckboxGroup1[]")
      {
        error.insertAfter("#CheckboxGroup1_error");	
      }
      else{
        error.insertAfter(element);	
      }
    }
  });
});