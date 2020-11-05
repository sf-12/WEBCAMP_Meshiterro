class PostImage < ApplicationRecord
  # 1つのuserモデルとのみ、関連づけられる
  belongs_to :user
  
  attachment :image # refile用にの画像アップ用メソッド（'image_id'の'_id'は含めない）
end
