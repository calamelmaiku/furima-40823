class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  #空の投稿を保存できないようにする
  validates :name, :text, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
end
