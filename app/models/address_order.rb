class AddressOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street, :build, :telephone, :order_id, :user_id, :item_id, :token

  with_options presence: true do

    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :telephone, format: {with: /\A[0-9]{10,11}\z/, message: 'must be 10 or 11 digits'}
    validates :token
    validates :item_id
    validates :user_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id )
    address = Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, build: build, telephone: telephone, order_id: order.id )
  end
end