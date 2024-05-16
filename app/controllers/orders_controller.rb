class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :city, :street, :build, :telephone, :order_id).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end

end