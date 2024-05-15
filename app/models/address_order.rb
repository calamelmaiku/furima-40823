class AddressOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street, :build, :telephone, :order_id

  with_options presence: true do

    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :telephone
    validates :order_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, build: build, telephone: telephone)
  end
end