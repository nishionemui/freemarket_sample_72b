# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

  # movies = Movie.create([{main_name: 'Star Wars' }, {main_name: 'Lord of the Rings' }])
  # Character.create(main_name: 'Luke', movie: movies.first)


  lady = MainCategory.create(main_name: "レディース")
  man = MainCategory.create(main_name: "メンズ")
  baby = MainCategory.create(main_name: "ベビー・キッズ")
  home = MainCategory.create(main_name: "インテリア・住まい・小物")
  book = MainCategory.create(main_name: "本・音楽・ゲーム")
  hobby = MainCategory.create(main_name: "おもちゃ・ホビー・グッズ")
  beauty = MainCategory.create(main_name: "コスメ・香水・美容")
  mech = MainCategory.create(main_name: "家電・スマホ・カメラ")
  sport = MainCategory.create(main_name: "スポーツ・レジャー")
  handmade = MainCategory.create(main_name: "ハンドメイド")
  ticket = MainCategory.create(main_name: "チケット")
  mobil = MainCategory.create(main_name: "自動車・オートバイ")
  other = MainCategory.create(main_name: "その他")
  
  # レディースの子カテゴリ
  lady_tops = lady.children.create(main_name: "トップス")
  lady_jacket = lady.children.create(main_name: "ジャケット/アウター")
  lady_pants = lady.children.create(main_name: "パンツ")
  lady_skirt = lady.children.create(main_name: "スカート")
  lady_onepiece = lady.children.create(main_name: "ワンピース")
  lady_other = lady.children.create(main_name: "その他")
  # レディースの孫カテゴリ
  lady_tops.children.create([{main_name: "Tシャツ/カットソー(半袖/袖なし)"}, {main_name: "Tシャツ/カットソー(七分/長袖)"}, {main_name: "シャツ/ブラウス(半袖/袖なし)"}, {main_name: "シャツ/ブラウス(七分/長袖)"}, {main_name: "ポロシャツ"}, {main_name: "キャミソール"}, {main_name: "タンクトップ"}, {main_name: "ホルターネック"}, {main_name: "ニット/セーター"}, {main_name: "チュニック"}, {main_name: "カーディガン/ボレロ"}, {main_name: "アンサンブル"}, {main_name: "ベスト/ジレ"}, {main_name: "パーカー"}, {main_name: "トレーナー/スウェット"}, {main_name: "ベアトップ/チューブトップ"}, {main_name: "ジャージ"}, {main_name: "その他"}])
  lady_jacket.children.create([{main_name: "テーラードジャケット"}, {main_name: "ノーカラージャケット"}, {main_name: "Gジャン/デニムジャケット"}, {main_name: "レザージャケット"}, {main_name: "ダウンジャケット"}, {main_name: "ライダースジャケット"}, {main_name: "ミリタリージャケット"}, {main_name: "ダウンベスト"}, {main_name: "ジャンパー/ブルゾン"}, {main_name: "ポンチョ"}, {main_name: "ロングコート"}, {main_name: "トレンチコート"}, {main_name: "ダッフルコート"}, {main_name: "ピーコート"}, {main_name: "チェスターコート"}, {main_name: "モッズコート"}, {main_name: "スタジャン"}, {main_name: "毛皮/ファーコート"}, {main_name: "スプリングコート"}, {main_name: "スカジャン"}, {main_name: "その他"}])
  lady_pants.children.create([{main_name: "デニム/ジーンズ"}, {main_name: "ショートパンツ"}, {main_name: "カジュアルパンツ"}, {main_name: "ハーフパンツ"}, {main_name: "チノパン"}, {main_name: "ワークパンツ/カーゴパンツ"}, {main_name: "クロップドパンツ"}, {main_name: "サロペット/オーバーオール"}, {main_name: "オールインワン"}, {main_name: "サルエルパンツ"}, {main_name: "ガウチョパンツ"}, {main_name: "その他"}])
  lady_skirt.children.create([{main_name: "ミニスカート"}, {main_name: "ひざ丈スカート"}, {main_name: "ロングスカート"}, {main_name: "キュロット"}, {main_name: "その他"}])
  lady_onepiece.children.create([{main_name: "ミニワンピース"}, {main_name: "ひざ丈ワンピース"}, {main_name: "ロングワンピース"}, {main_name: "その他"}])
  lady_other.children.create([{main_name: "スカートスーツ上下"}, {main_name: "パンツスーツ上下"}, {main_name: "ドレス"}, {main_name: "パーティーバッグ"}, {main_name: "シューズ"}, {main_name: "ウェディング"}])
  
  # メンズの子カテゴリ
  man_tops = man.children.create(main_name: "トップス")
  man_jacket = man.children.create(main_name: "ジャケット/アウター")
  man_pants = man.children.create(main_name: "パンツ")
  man_suits = man.children.create(main_name: "スーツ")
  man_other = man.children.create(main_name: "その他")
  # メンズの孫カテゴリ
  man_tops.children.create([{main_name: "トップス"}, {main_name: "アウター"}, {main_name: "パンツ"}, {main_name: "おくるみ"}, {main_name: "下着/肌着"}, {main_name: "パジャマ"}, {main_name: "ロンパース"}, {main_name: "その他"}])
  man_jacket.children.create([{main_name: "コート"}, {main_name: "ジャケット/上着"}, {main_name: "トップス(Tシャツ/カットソー)"}, {main_name: "トップス(トレーナー)"}, {main_name: "トップス(チュニック)"}, {main_name: "トップス(タンクトップ)"}, {main_name: "トップス(その他)"}])
  man_pants.children.create([{main_name: "デニム/ジーンズ"}, {main_name: "ショートパンツ"}, {main_name: "カジュアルパンツ"}, {main_name: "ハーフパンツ"}, {main_name: "チノパン"}, {main_name: "ワークパンツ/カーゴパンツ"}, {main_name: "クロップドパンツ"}, {main_name: "サロペット/オーバーオール"}, {main_name: "オールインワン"}, {main_name: "サルエルパンツ"}, {main_name: "ガウチョパンツ"}, {main_name: "その他"}])
  man_suits.children.create([{main_name: "パンツ"}, {main_name: "セットアップ"}, {main_name: "パジャマ"}, {main_name: "フォーマル/ドレス"}, {main_name: "和服"}, {main_name: "浴衣"}, {main_name: "甚平"}, {main_name: "水着"}, {main_name: "その他"}])
  man_other.children.create([{main_name: "スニーカー"}, {main_name: "サンダル"}, {main_name: "ブーツ"}, {main_name: "長靴"}, {main_name: "靴下/スパッツ"}, {main_name: "帽子"}, {main_name: "エプロン"}, {main_name: "サスペンダー"}, {main_name: "タイツ"}, {main_name: "ハンカチ"}, {main_name: "バンダナ"}, {main_name: "ベルト"}, {main_name: "マフラー"}, {main_name: "傘"}, {main_name: "手袋"}, {main_name: "スタイ"}, {main_name: "バッグ"}, {main_name: "その他"}])
  
  # ベビーの子カテゴリ
  baby_girl = baby.children.create(main_name: "ベビー服(女の子用)")
  baby_boy = baby.children.create(main_name: "ベビー服(男の子用)")
  baby_item = baby.children.create(main_name: "子ども用ファッション小物")
  baby_toilet = baby.children.create(main_name: "おむつ/トイレ/バス")
  baby_other = baby.children.create(main_name: "その他")
  # ベビーの孫カテゴリ
  baby_girl.children.create([{main_name: "コート"}, {main_name: "ジャケット/上着"}, {main_name: "トップス(Tシャツ/カットソー)"}, {main_name: "トップス(トレーナー)"}, {main_name: "トップス(その他)"}, {main_name: "ボトムス"}, {main_name: "パジャマ"}, {main_name: "その他"}])
  baby_boy.children.create([{main_name: "コート"}, {main_name: "ジャケット/上着"}, {main_name: "トップス(Tシャツ/カットソー)"}, {main_name: "トップス(トレーナー)"}, {main_name: "トップス(その他)"}, {main_name: "ボトムス"}, {main_name: "パジャマ"}, {main_name: "その他"}])
  baby_item.children.create([{main_name: "おふろのおもちゃ"}, {main_name: "がらがら"}, {main_name: "オルゴール"}, {main_name: "ベビージム"}, {main_name: "手押し車/カタカタ"}, {main_name: "知育玩具"}, {main_name: "その他"}])
  baby_toilet.children.create([{main_name: "おむつ用品"}, {main_name: "おまる/補助便座"}, {main_name: "トレーニングパンツ"}, {main_name: "ベビーバス"}, {main_name: "お風呂用品"}, {main_name: "その他"}])
  baby_other.children.create([{main_name: "お宮参り用品"}, {main_name: "お食い初め用品"}, {main_name: "アルバム"}, {main_name: "手形/足形"}, {main_name: "その他"}])
  
  # 家庭用品の子カテゴリ
  home_kitchen = home.children.create(main_name: "キッチン/食器")
  home_bed = home.children.create(main_name: "ベッド/マットレス")
  home_sofa = home.children.create(main_name: "ソファ/ソファベッド")
  home_chair = home.children.create(main_name: "椅子/チェア")
  home_table = home.children.create(main_name: "机/テーブル")
  home_other = home.children.create(main_name: "その他")
  # 家庭用品の孫カテゴリ
  home_kitchen.children.create([{main_name: "食器"}, {main_name: "調理器具"}, {main_name: "収納/キッチン雑貨"}, {main_name: "弁当用品"}, {main_name: "カトラリー(スプーン等)"}, {main_name: "テーブル用品"}, {main_name: "容器"}, {main_name: "エプロン"}, {main_name: "アルコールグッズ"}, {main_name: "浄水機"}, {main_name: "その他"}])
  home_bed.children.create([{main_name: "セミシングルベッド"}, {main_name: "シングルベッド"}, {main_name: "セミダブルベッド"}, {main_name: "ダブルベッド"}, {main_name: "ワイドダブルベッド"}, {main_name: "クイーンベッド"}, {main_name: "キングベッド"}, {main_name: "脚付きマットレスベッド"}, {main_name: "マットレス"}, {main_name: "すのこベッド"}, {main_name: "ロフトベッド/システムベッド"}, {main_name: "簡易ベッド/折りたたみベッド"}, {main_name: "収納付き"}, {main_name: "その他"}])
  home_sofa.children.create([{main_name: "ソファセット"}, {main_name: "シングルソファ"}, {main_name: "ラブソファ"}, {main_name: "トリプルソファ"}, {main_name: "オットマン"}, {main_name: "コーナーソファ"}, {main_name: "ビーズソファ/クッションソファ"}, {main_name: "ローソファ/フロアソファ"}, {main_name: "ソファベッド"}, {main_name: "応接セット"}, {main_name: "ソファカバー"}, {main_name: "リクライニングソファ"}, {main_name: "その他"}])
  home_chair.children.create([{main_name: "一般"}, {main_name: "スツール"}, {main_name: "ダイニングチェア"}, {main_name: "ハイバックチェア"}, {main_name: "ロッキングチェア"}, {main_name: "座椅子"}, {main_name: "折り畳みイス"}, {main_name: "デスクチェア"}, {main_name: "その他"}])
  home_table.children.create([{main_name: "こたつ"}, {main_name: "カウンターテーブル"}, {main_name: "サイドテーブル"}, {main_name: "センターテーブル"}, {main_name: "ダイニングテーブル"}, {main_name: "座卓/ちゃぶ台"}, {main_name: "アウトドア用"}, {main_name: "パソコン用"}, {main_name: "事務机/学習机"}, {main_name: "その他"}])
  home_other.children.create([{main_name: "正月"}, {main_name: "成人式"}, {main_name: "バレンタインデー"}, {main_name: "ひな祭り"}, {main_name: "子どもの日"}, {main_name: "母の日"}, {main_name: "父の日"}, {main_name: "サマーギフト/お中元"}, {main_name: "夏/夏休み"}, {main_name: "ハロウィン"}, {main_name: "敬老の日"}, {main_name: "七五三"}, {main_name: "お歳暮"}, {main_name: "クリスマス"}, {main_name: "冬一般"}, {main_name: "その他"}])
  
  # 本の子カテゴリ
  book_book = book.children.create(main_name: "本")
  book_manga = book.children.create(main_name: "漫画")
  book_cd = book.children.create(main_name: "CD")
  book_game = book.children.create(main_name: "テレビゲーム")
  # 本の孫カテゴリ
  book_book.children.create([{main_name: "文学/小説"}, {main_name: "人文/社会"}, {main_name: "ノンフィクション/教養"}, {main_name: "地図/旅行ガイド"}, {main_name: "ビジネス/経済"}, {main_name: "健康/医学"}, {main_name: "コンピュータ/IT"}, {main_name: "趣味/スポーツ/実用"}, {main_name: "住まい/暮らし/子育て"}, {main_name: "アート/エンタメ"}, {main_name: "洋書"}, {main_name: "絵本"}, {main_name: "参考書"}, {main_name: "その他"}])
  book_manga.children.create([{main_name: "全巻セット"}, {main_name: "少年漫画"}, {main_name: "少女漫画"}, {main_name: "青年漫画"}, {main_name: "女性漫画"}, {main_name: "同人誌"}, {main_name: "その他"}])
  book_cd.children.create([{main_name: "邦楽"}, {main_name: "洋楽"}, {main_name: "アニメ"}, {main_name: "クラシック"}, {main_name: "K-POP/アジア"}, {main_name: "キッズ/ファミリー"}, {main_name: "その他"}])
  book_game.children.create([{main_name: "家庭用ゲーム本体"}, {main_name: "家庭用ゲームソフト"}, {main_name: "携帯用ゲーム本体"}, {main_name: "携帯用ゲームソフト"}, {main_name: "PCゲーム"}, {main_name: "その他"}])
  
  # 趣味の子カテゴリ
  hobby_toy = hobby.children.create(main_name: "おもちゃ")
  hobby_card = hobby.children.create(main_name: "トレーディングカード")
  hobby_figure = hobby.children.create(main_name: "フィギュア")
  hobby_instrument = hobby.children.create(main_name: "楽器/器材")
  hobby_other = hobby.children.create(main_name: "その他")
  # 趣味の孫カテゴリ
  hobby_toy.children.create([{main_name: "キャラクターグッズ"}, {main_name: "ぬいぐるみ"}, {main_name: "小物/アクセサリー"}, {main_name: "模型/プラモデル"}, {main_name: "ミニカー"}, {main_name: "トイラジコン"}, {main_name: "プラモデル"}, {main_name: "ホビーラジコン"}, {main_name: "鉄道模型"}, {main_name: "その他"}])
  hobby_card.children.create([{main_name: "遊戯王"}, {main_name: "マジック：ザ・ギャザリング"}, {main_name: "ポケモンカードゲーム"}, {main_name: "デュエルマスターズ"}, {main_name: "バトルスピリッツ"}, {main_name: "プリパラ"}, {main_name: "アイカツ"}, {main_name: "カードファイト!!ヴァンガード"}, {main_name: "ヴァイスシュヴァルツ"}, {main_name: "プロ野球オーナーズリーグ"}, {main_name: "ベースボールヒーローズ"}, {main_name: "ドラゴンボール"}, {main_name: "スリーブ"}, {main_name: "その他"}])
  hobby_figure.children.create([{main_name: "コミック/アニメ"}, {main_name: "特撮"}, {main_name: "ゲームキャラクター"}, {main_name: "SF/ファンタジー/ホラー"}, {main_name: "アメコミ"}, {main_name: "スポーツ"}, {main_name: "ミリタリー"}, {main_name: "その他"}])
  hobby_instrument.children.create([{main_name: "エレキギター"}, {main_name: "アコースティックギター"}, {main_name: "ベース"}, {main_name: "エフェクター"}, {main_name: "アンプ"}, {main_name: "弦楽器"}, {main_name: "管楽器"}, {main_name: "鍵盤楽器"}, {main_name: "打楽器"}, {main_name: "和楽器"}, {main_name: "楽譜/スコア"}, {main_name: "レコーディング/PA機器"}, {main_name: "DJ機器"}, {main_name: "DTM/DAW"}, {main_name: "その他"}])
  hobby_other.children.create([{main_name: "トランプ/UNO"}, {main_name: "カルタ/百人一首"}, {main_name: "ダーツ"}, {main_name: "ビリヤード"}, {main_name: "麻雀"}, {main_name: "パズル/ジグソーパズル"}, {main_name: "囲碁/将棋"}, {main_name: "オセロ/チェス"}, {main_name: "人生ゲーム"}, {main_name: "野球/サッカーゲーム"}, {main_name: "スポーツ"}, {main_name: "三輪車/乗り物"}, {main_name: "ヨーヨー"}, {main_name: "模型製作用品"}, {main_name: "鉄道"}, {main_name: "航空機"}, {main_name: "アマチュア無線"}, {main_name: "パチンコ/パチスロ"}, {main_name: "その他"}])
  
  # 美容の子カテゴリ
  beauty_base = beauty.children.create(main_name: "ベースメイク")
  beauty_makeup = beauty.children.create(main_name: "メイクアップ")
  beauty_other = beauty.children.create(main_name: "その他")
  # 美容の孫カテゴリ
  beauty_base.children.create([{main_name: "ファンデーション"}, {main_name: "化粧下地"}, {main_name: "コントロールカラー"}, {main_name: "BBクリーム"}, {main_name: "CCクリーム"}, {main_name: "コンシーラー"}, {main_name: "フェイスパウダー"}, {main_name: "トライアルセット/サンプル"}, {main_name: "その他"}])
  beauty_makeup.children.create([{main_name: "アイシャドウ"}, {main_name: "口紅"}, {main_name: "リップグロス"}, {main_name: "リップライナー"}, {main_name: "チーク"}, {main_name: "フェイスカラー"}, {main_name: "マスカラ"}, {main_name: "アイライナー"}, {main_name: "つけまつげ"}, {main_name: "アイブロウペンシル"}, {main_name: "パウダーアイブロウ"}, {main_name: "眉マスカラ"}, {main_name: "トライアルセット/サンプル"}, {main_name: "メイク道具/化粧小物"}, {main_name: "美顔用品/美顔ローラー"}, {main_name: "その他"}])
  beauty_other.children.create([{main_name: "健康用品"}, {main_name: "看護/介護用品"}, {main_name: "救急/衛生用品"}, {main_name: "その他"}])
  
  # 機械の子カテゴリ
  mech_phone = mech.children.create(main_name: "スマートフォン/携帯電話")
  mech_pc = mech.children.create(main_name: "PC/タブレット")
  mech_camera = mech.children.create(main_name: "カメラ")
  mech_other = mech.children.create(main_name: "その他")
  # 機械の孫カテゴリ
  mech_phone.children.create([{main_name: "スマートフォン本体"}, {main_name: "バッテリー/充電器"}, {main_name: "携帯電話本体"}, {main_name: "PHS本体"}, {main_name: "その他"}])
  mech_pc.children.create([{main_name: "タブレット"}, {main_name: "ノートPC"}, {main_name: "デスクトップ型PC"}, {main_name: "ディスプレイ"}, {main_name: "電子ブックリーダー"}, {main_name: "PC周辺機器"}, {main_name: "PCパーツ"}, {main_name: "その他"}])
  mech_camera.children.create([{main_name: "デジタルカメラ"}, {main_name: "ビデオカメラ"}, {main_name: "レンズ(単焦点)"}, {main_name: "レンズ(ズーム)"}, {main_name: "フィルムカメラ"}, {main_name: "防犯カメラ"}, {main_name: "その他"}])
  mech_other.children.create([{main_name: "ポータブルプレーヤー"}, {main_name: "イヤフォン"}, {main_name: "ヘッドフォン"}, {main_name: "アンプ"}, {main_name: "スピーカー"}, {main_name: "ケーブル/シールド"}, {main_name: "ラジオ"}, {main_name: "その他"}])
  
  # スポーツの子カテゴリ
  sport_fishing = sport.children.create(main_name: "フィッシング")
  sport_training = sport.children.create(main_name: "トレーニング/エクササイズ")
  sport_soccer = sport.children.create(main_name: "サッカー/フットサル")
  sport_other = sport.children.create(main_name: "その他")
  # スポーツの孫カテゴリ
  sport_fishing.children.create([{main_name: "ロッド"}, {main_name: "リール"}, {main_name: "ルアー用品"}, {main_name: "ウエア"}, {main_name: "釣り糸/ライン"}, {main_name: "その他"}])
  sport_training.children.create([{main_name: "ランニング"}, {main_name: "ウォーキング"}, {main_name: "ヨガ"}, {main_name: "トレーニング用品"}, {main_name: "その他"}])
  sport_soccer.children.create([{main_name: "ウェア"}, {main_name: "シューズ"}, {main_name: "ボール"}, {main_name: "アクセサリー"}, {main_name: "記念グッズ"}, {main_name: "応援グッズ"}, {main_name: "その他"}])
  sport_other.children.create([{main_name: "ダンス/バレエ"}, {main_name: "サーフィン"}, {main_name: "バスケットボール"}, {main_name: "バドミントン"}, {main_name: "バレーボール"}, {main_name: "スケートボード"}, {main_name: "陸上競技"}, {main_name: "ラグビー"}, {main_name: "アメリカンフットボール"}, {main_name: "ボクシング"}, {main_name: "ボウリング"}, {main_name: "その他"}])
  
  # ハンドメイドの子カテゴリ
  handmade_item = handmade.children.create(main_name: "ファッション/小物")
  handmade_accessory = handmade.children.create(main_name: "アクセサリー/時計")
  handmade_interior = handmade.children.create(main_name: "日用品/インテリア")
  handmade_other = handmade.children.create(main_name: "その他")
  # ハンドメイドの孫カテゴリ
  handmade_item.children.create([{main_name: "ピアス"}, {main_name: "イヤリング"}, {main_name: "ネックレス"}, {main_name: "ブレスレット"}, {main_name: "リング"}, {main_name: "チャーム"}, {main_name: "ヘアゴム"}, {main_name: "アンクレット"}, {main_name: "その他"}])
  handmade_accessory.children.create([{main_name: "アクセサリー(男性用)"}, {main_name: "時計(女性用)"}, {main_name: "時計(男性用)"}, {main_name: "その他"}])
  handmade_interior.children.create([{main_name: "クラフト/布製品"}, {main_name: "おもちゃ/人形"}, {main_name: "その他"}])
  handmade_other.children.create([{main_name: "バッグ(女性用)"}, {main_name: "バッグ(男性用)"}, {main_name: "財布(女性用)"}, {main_name: "財布(男性用)"}, {main_name: "ファッション雑貨"}, {main_name: "その他"}])
  
  # チケットの子カテゴリ
  ticket_music = ticket.children.create(main_name: "音楽")
  ticket_sport = ticket.children.create(main_name: "スポーツ")
  ticket_show = ticket.children.create(main_name: "演劇/芸能")
  ticket_other = ticket.children.create(main_name: "その他")
  # チケットの孫カテゴリ
  ticket_music.children.create([{main_name: "男性アイドル"}, {main_name: "女性アイドル"}, {main_name: "韓流"}, {main_name: "国内アーティスト"}, {main_name: "海外アーティスト"}, {main_name: "音楽フェス"}, {main_name: "声優/アニメ"}, {main_name: "その他"}])
  ticket_sport.children.create([{main_name: "サッカー"}, {main_name: "野球"}, {main_name: "テニス"}, {main_name: "格闘技/プロレス"}, {main_name: "相撲/武道"}, {main_name: "ゴルフ"}, {main_name: "バレーボール"}, {main_name: "バスケットボール"}, {main_name: "モータースポーツ"}, {main_name: "ウィンタースポーツ"}, {main_name: "その他"}])
  ticket_show.children.create([{main_name: "ミュージカル"}, {main_name: "演劇"}, {main_name: "伝統芸能"}, {main_name: "落語"}, {main_name: "お笑い"}, {main_name: "オペラ"}, {main_name: "サーカス"}, {main_name: "バレエ"}, {main_name: "その他"}])
  ticket_other.children.create([{main_name: "ショッピング"}, {main_name: "レストラン/食事券"}, {main_name: "フード/ドリンク券"}, {main_name: "宿泊券"}, {main_name: "その他"}])
  
  # 自動車の子カテゴリ
  mobil_car = mobil.children.create(main_name: "自動車本体")
  mobil_carpart = mobil.children.create(main_name: "自動車アクセサリー")
  mobil_bike = mobil.children.create(main_name: "オートバイ車体")
  mobil_other = mobil.children.create(main_name: "その他")
  # 自動車の孫カテゴリ
  mobil_car.children.create([{main_name: "国内自動車本体"}, {main_name: "外国自動車本体"}, {main_name: "タイヤ/ホイールセット"}, {main_name: "タイヤ"}, {main_name: "ホイール"}, {main_name: "その他"}])
  mobil_carpart.children.create([{main_name: "車内アクセサリー"}, {main_name: "カーナビ"}, {main_name: "カーオーディオ"}, {main_name: "車外アクセサリー"}, {main_name: "メンテナンス用品"}, {main_name: "チャイルドシート"}, {main_name: "ドライブレコーダー"}, {main_name: "レーダー探知機"}, {main_name: "カタログ/マニュアル"}, {main_name: "セキュリティ"}, {main_name: "ETC"}, {main_name: "その他"}])
  mobil_bike.children.create([{main_name: "国内車本体"}, {main_name: "外国車本体"}, {main_name: "タイヤ"}, {main_name: "マフラー"}, {main_name: "エンジン、冷却装置"}, {main_name: "外国オートバイ用パーツ"}, {main_name: "その他"}])
  mobil_other.children.create([{main_name: "ヘルメット/シールド"}, {main_name: "バイクウエア/装備"}, {main_name: "アクセサリー"}, {main_name: "メンテナンス"}, {main_name: "カタログ/マニュアル"}, {main_name: "その他"}])
  
  # その他の子カテゴリ
  other_matome = other.children.create(main_name: "まとめ売り")
  other_food = other.children.create(main_name: "食品")
  other_drink = other.children.create(main_name: "飲料/酒")
  other_other = other.children.create(main_name: "その他")
  # その他の孫カテゴリ
  other_matome.children.create([{main_name: "ペットフード"}, {main_name: "犬用品"}, {main_name: "猫用品"}, {main_name: "魚用品/水草"}, {main_name: "小動物用品"}, {main_name: "爬虫類/両生類用品"}, {main_name: "かご/おり"}, {main_name: "鳥用品"}, {main_name: "虫類用品"}, {main_name: "その他"}])
  other_food.children.create([{main_name: "菓子"}, {main_name: "米"}, {main_name: "野菜"}, {main_name: "果物"}, {main_name: "調味料"}, {main_name: "魚介類(加工食品)"}, {main_name: "肉類(加工食品)"}, {main_name: "その他 加工食品"}, {main_name: "その他"}])
  other_drink.children.create([{main_name: "コーヒー"}, {main_name: "ソフトドリンク"}, {main_name: "ミネラルウォーター"}, {main_name: "茶"}, {main_name: "ウイスキー"}, {main_name: "ワイン"}, {main_name: "ブランデー"}, {main_name: "焼酎"}, {main_name: "日本酒"}, {main_name: "ビール、発泡酒"}, {main_name: "その他"}])
  other_other.children.create([{main_name: "オフィス用品一般"}, {main_name: "オフィス家具"}, {main_name: "店舗用品"}, {main_name: "OA機器"}, {main_name: "ラッピング/包装"}, {main_name: "その他"}])