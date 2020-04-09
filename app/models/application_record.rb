class ApplicationRecord < ActiveRecord::Base
# < 対応するテーブルが存在しないことを指定するための記述 >
  self.abstract_class = true
end
