class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :get_params_id, only: [:index, :update]
  before_action :move_to_index, only: [:index]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_params)
    if @address_order.valid?
      pay_item
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def get_params_id
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless current_user.id != @item.user_id
      redirect_to controller: 'items', action: 'index'
    end
  end

  def address_params
    params.require(:address_order).permit(:postcode, :prefecture_id, :city, :street, :build, :telephone, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
    @address_order.save
    redirect_to root_path
  end

end