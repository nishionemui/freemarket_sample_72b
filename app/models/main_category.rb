class MainCategory < ApplicationRecord
  belongs_to :product
  has_many :sub_categories
end
