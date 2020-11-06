class PostImage < ApplicationRecord
  # 他のモデルとの関係
  belongs_to :user  # 1つのuserモデルとのみ、関連づけられる
  attachment :image # refile用にの画像アップ用メソッド（'image_id'の'_id'は含めない）
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # バリデーションチェック
  validates :shop_name, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
