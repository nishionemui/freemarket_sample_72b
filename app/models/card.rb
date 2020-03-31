class Card < ApplicationRecord
  belongs_to :user
  # enum card_company:{
  #   VISA:1,Mastercard:2,セゾンカード:3,JCB:4,アメリカンエキスプレス:5,ダイナーズ:6,ディスカバー:7
  # }
end
