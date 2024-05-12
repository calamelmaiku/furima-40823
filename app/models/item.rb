class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :span

  #空の投稿を保存できないようにする
  validates :name, presence: true
  validates :comment, presence: true
  validates :price, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :span_id, numericality: { other_than: 1 }
end
