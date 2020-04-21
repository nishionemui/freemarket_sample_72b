class Like < ApplicationRecord


  belongs_to :product, counter_cache: :likes_count
  belongs_to :user

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.product_id) FROM likes where likes.product_id = product.id GROUP BY likes.product_id)'
    Arel.sql(query)
  end
end
