class SubCategory < ApplicationRecord
  belongs_to :main_category
  has_many :sub2_categories

  # self.data = [レディース
#     {id: 1, name: 'トップス'}, {id: 2, name: 'ジャケット/アウター'}, {id: 3, name: 'パンツ'},
#     {id: 4, name: '・スカート'}, {id: 5, name: 'ワンピース'}, {id: 6, name: '靴'},
#     {id: 7, name: 'ルームウェア・パジャマ'}, {id: 8, name: 'レッグウェア'}, {id: 9, name: '帽子'},
#     {id: 10, name: 'バック'}, {id: 11, name: '・アクセサリー'}, {id: 12, name: 'ヘアアクセサリー'},
#     {id: 13, name: '小物'}, {id: 14, name: '時計'}, {id: 15, name: 'ウィッグ/エクステ'},
#     {id: 16, name: '浴衣/水着'}, {id: 17, name: 'スーツ/フォーマル/ドレス'}, {id: 18, name: 'マタニティ'},
#     {id: 19, name: 'その他'},
  

#     self.data = [メンズ
#     {id: 1, name: 'トップス'}, {id: 2, name: 'ジャケット/アウター'}, {id: 3, name: 'パンツ'},
#     {id: 4, name: '靴'}, {id: 5, name: 'バッグ'}, {id: 6, name: 'スーツ'},
#     {id: 7, name: '帽子'}, {id: 8, name: 'アクセサリー'}, {id: 9, name: '小物'},
#     {id: 10, name: '時計'}, {id: 11, name: '水着'}, {id: 12, name: 'レッグウェア'},
#     {id: 13, name: 'アンダーウェア'}, {id: 14, name: 'その他'}, {id: 15, name: 'ウィッグ/エクステ'},
#     {id: 16, name: '浴衣/水着'}, {id: 17, name: 'スーツ/フォーマル/ドレス'}, {id: 18, name: 'マタニティ'},
#     {id: 19, name: 'その他'},


#     self.data = [ベビー・キッズ
#     {id: 1, name: 'ベビー服(女の子用)~95cm'}, {id: 2, name: 'ベビー服(男の子用)~95cm'}, {id: 3, name: 'ベビー服(男女兼用)~95cm'},
#     {id: 4, name: 'キッズ服(女の子用)~100cm'}, {id: 5, name: 'キッズ服(男の子用)~100cm'}, {id: 6, name: 'キッズ服(男女兼用)~100cm'},
#     {id: 7, name: 'キッズ靴'}, {id: 8, name: '子ども用ファッション小物'}, {id: 9, name: 'おむつ/トイレ/バス'},
#     {id: 10, name: '外出/移動用品'}, {id: 11, name: '授乳/食事'}, {id: 12, name: 'ベビー家具/寝具/寝室用品'},
#     {id: 13, name: 'おもちゃ'}, {id: 14, name: '行事/記念品'}, {id: 15, name: 'その他'},

#     self.data = [インテリア・住まい・小物
#     {id: 1, name: 'キッチン/食器'}, {id: 2, name: 'ベッド/マットレス'}, {id: 3, name: 'ソファ／ソファベッド'},
#     {id: 4, name: '椅子/チェア'}, {id: 5, name: '机/テーブル'}, {id: 6, name: '収納家具'},
#     {id: 7, name: 'ラグ/カーペット/マット'}, {id: 8, name: '・カーテン/ブラインド'}, {id: 9, name: 'ライト/照明'},
#     {id: 10, name: '寝具'}, {id: 11, name: 'インテリア小物'}, {id: 12, name: '季節/年中行事'},
#     {id: 13, name: 'その他'},

#     self.data = [本・音楽。ゲーム
#     {id: 1, name: '本'}, {id: 2, name: '漫画'}, {id: 3, name: '雑誌'},
#     {id: 4, name: 'CD'}, {id: 5, name: 'DVD/ブルーレイ'}, {id: 6, name: 'レコード'},
#     {id: 7, name: 'テレビゲーム'}, 

#     self.data = [おもちゃ・ホビー・グッズ
#     {id: 1, name: 'おもちゃ'}, {id: 2, name: 'タレントグッズ'}, {id: 3, name: 'コミック/アニメグッズ'},
#     {id: 4, name: 'トレーディングカード'}, {id: 5, name: 'フィギュア'}, {id: 6, name: '楽器/器材'},
#     {id: 7, name: 'コレクション'}, {id: 8, name: 'ミニタリー'}, {id: 9, name: '美術品'},
#     {id: 10, name: 'アート用品'}, {id: 11, name: 'その他'},

#     self.data = [コスメ・香水・美容
#     {id: 1, name: 'ベースメイク'}, {id: 2, name: '・メイクアップ'}, {id: 3, name: 'ネイルケア'},
#     {id: 4, name: '香水'}, {id: 5, name: 'スキンケア/基礎化粧品'}, {id: 6, name: 'ヘアケア'},
#     {id: 7, name: 'ボディケア'}, {id: 8, name: 'オーラルケア'}, {id: 9, name: 'リラクゼーション'},
#     {id: 10, name: 'ダイエット'}, {id: 11, name: 'その他'},

  #   self.data = [家電・スマホ・カメラ
  #   {id: 1, name: 'ベースメイク'}, {id: 2, name: '・メイクアップ'}, {id: 3, name: 'ネイルケア'},
  #   {id: 4, name: '香水'}, {id: 5, name: 'スキンケア/基礎化粧品'}, {id: 6, name: 'ヘアケア'},
  #   {id: 7, name: 'ボディケア'}, {id: 8, name: 'オーラルケア'}, {id: 9, name: 'リラクゼーション'},
  #   {id: 10, name: 'ダイエット'}, {id: 11, name: 'その他'}, {id: 12, name: '季節/年中行事'},
  #   {id: 13, name: 'その他'}, {id: 14, name: '行事/記念品'}, {id: 15, name: 'その他'},
  #   {id: 16, name: '浴衣/水着'}, {id: 17, name: 'スーツ/フォーマル/ドレス'}, {id: 18, name: 'マタニティ'},
  #   {id: 19, name: 'その他'},

  # self.data = [スポーツ・レジャー
  #   {id: 1, name: 'ゴルフ'}, {id: 2, name: 'フィッシング'}, {id: 3, name: '自転車'},
  #   {id: 4, name: 'トレーニング/エクササイズ'}, {id: 5, name: '野球'}, {id: 6, name: 'サッカー/フットサル'},
  #   {id: 7, name: 'テニス'}, {id: 8, name: 'スノーボード'}, {id: 9, name: '・スキー'},
  #   {id: 10, name: 'その他のスポーツ'}, {id: 11, name: 'アウトドア'}, {id: 12, name: 'その他'},
  #   {id: 13, name: 'その他'}, {id: 14, name: '行事/記念品'}, {id: 15, name: 'その他'},
    
  # self.data = [ハンドメイド
  #   {id: 1, name: 'アクセサリー(女性)'}, {id: 2, name: 'ファッション/小物'}, {id: 3, name: 'アクセサリー/時計'},
  #   {id: 4, name: '日用品/インテリア'}, {id: 5, name: '趣味/おもちゃ'}, {id: 6, name: 'キッズ/ベビー'},
  #   {id: 7, name: '素材/材料'}, {id: 8, name: '二次創作物'}, {id: 9, name: 'その他'},

  # self.data = [チケット
  #   {id: 1, name: '音楽'}, {id: 2, name: 'スポーツ'}, {id: 3, name: '演劇/芸能'},
  #   {id: 4, name: 'イベント'}, {id: 5, name: '映画'}, {id: 6, name: '施設利用券'},
  #   {id: 7, name: '優待券/'}, {id: 8, name: '二次創作物'}, {id: 9, name: 'その他'},
  #   {id: 10, name: 'その他のスポーツ'}, {id: 11, name: 'アウトドア'}, {id: 12, name: 'その他'},
  #   {id: 13, name: 'その他'}, {id: 14, name: '行事/記念品'}, {id: 15, name: 'その他'},
  #   {id: 16, name: '浴衣/水着'}, {id: 17, name: 'スーツ/フォーマル/ドレス'}, {id: 18, name: 'マタニティ'},
  #   {id: 19, name: 'その他'},
  
    
# end

end
