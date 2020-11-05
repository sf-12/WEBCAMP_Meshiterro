class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # post_imageモデルを複数持ちうる。userモデルが消えたら紐づくpost_imageモデルも消す
  has_many :post_images, dependent: :destroy
end
