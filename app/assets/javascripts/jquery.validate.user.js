$(function () {
  // メソッドの定義
  var methods = {
    email: function (value, element) { // メールアドレスの正規表現
      return this.optional(element) || /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/i.test(value);
    },
    password: function (value, element) { // パスワードの正規表現
      return this.optional(element) || /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i.test(value);
    },
    name_read : function (value, element) {  //カタカナの正規表現
      return this.optional(element) || /^[ァ-ヴ]+$/.test(value);
    },
    // phone : function (value, element) {  //電話の正規表現
    //   return this.optional(element) || /^\d{2,5}-\d{1,4}-\d{4}$/.test(value);
    // },
  }
  // メソッドの追加
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  // バリデーションの実行
  $("#user_form").validate({
    // ルール設定
    rules: {
      "user[nickname]": {
        required: true // 入力有無チェック
      },
      "user[email]": {
        required: true, // 入力有無チェック
        email: true // メールアドレスの正規表現チェック
      },
      "user[password]": {
        required: true,// 入力有無チェック
        password: true
      },
      "user[password_confirmation]": {
        required: true, // 入力有無チェック
        equalTo: "#pass"
      },
      "user[first_name]": {
        required: true 
      },
      "user[last_name]": {
        required: true 
      },
      "user[first_name_read]": {
        required: true,
        name_read: true
      },
      "user[last_name_read]": {
        required: true,
        name_read: true
      },
      "user[phone_num]": {
        required: true
        // phone: true
      },
    },
    // エラーメッセージの定義
    messages: {
      "user[nickname]": {
        required: "ニックネームを入力してください。"
      },
      "user[email]": {
        required: "メールアドレスを入力してください。",
        email: "フォーマットが不適切です。"
      },
      "user[password]": {
        required: "パスワードを入力してください。",
        password: "英字と数字両方を含むパスワードを入力してください。"
      },
      "user[password_confirmation]": {
        required: "パスワードを入力してください。",
        password: "英字と数字両方を含むパスワードを入力してください。",
        equalTo: "入力した値が一致しません。"
      },
      "user[first_name]": {
        required: "姓を入力してください。"
      },
      "user[last_name]": {
        required: "名を入力してください。" 
      },
      "user[first_name_read]": {
        required: "姓カナを入力してください。",
        name_read: "カタカナで入力してください。"
      },
      "user[last_name_read]": {
        required: "名カナを入力してください。",
        name_read: "カタカナで入力してください。"
      },
      "user[phone_num]": {
        required: "電話番号を入力してください。"
        // phone: "「例)090-1234-5678」で入力してください"
      },
      
    },
    errorClass: "invalid", // バリデーションNGの場合に追加するクラス名の指定
    errorElement: "p", // エラーメッセージの要素種類の指定
    validClass: "valid", // バリデーションOKの場合に追加するクラス名の指定
  });
  // 入力欄をフォーカスアウトしたときにバリデーションを実行
  $("#nickname, #email, #pass, #pass-two, #first-name, #last-name, #first-name-read,#last-name-read, #phone-num").blur(function () {
    $(this).valid();
  });
});








$(function () {
  // メソッドの定義
  var methods = {
    zip_code: function (value, element) {
      return this.optional(element) || /^\d{3}[-]\d{4}$/.test(value); //郵便番号
    },
  }
  // メソッドの追加
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  // バリデーションの実行
  $("#new_address").validate({
    // ルール設定
    rules: {
      "address[zip_code]": {
        required: true,
        zip_code: true
      },
      "address[prefecture_id]": {
        required: true
      },
      "address[city]": {
        required: true
      },
      "address[address1]": {
        required: true 
      },
    },
    messages: {
      "address[zip_code]": {
        required: "郵便番号を入力してください。",
        zip_code: "郵便番号を入力してください。"
      },
      "address[prefecture_id]": {
        required: "都道府県を入力してください。"
      },
      "address[city]": {
        required: "市区町村を入力してください。"
      },
      "address[address1]": {
        required: "番地を入力してください。"
      },
    },
    errorClass: "invalid",
    errorElement: "p",
    validClass: "valid",
  });
  // 入力欄をフォーカスアウトしたときにバリデーションを実行
  $("#zip-code, #prefecture, #city, #address1").blur(function () {
    $(this).valid();
  });
});

