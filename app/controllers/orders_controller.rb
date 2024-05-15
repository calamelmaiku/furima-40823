class OrdersController < ApplicationController
  def index
    @address_order = AddressOrder.new
  end

  def new
  end

  def create
    @address_order = AddressOrder.new(donation_params)
    if @donation_address.valid?
      @donation_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def donation_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :city, :street, :build, :telephone, :order_id).merge(user_id: current_user.id)
  end
end
