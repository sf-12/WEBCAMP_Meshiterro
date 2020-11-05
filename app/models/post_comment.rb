class PostComment < ApplicationRecord
  # 他のモデルとの関係
  belongs_to :user
  belongs_to :post_image
end
