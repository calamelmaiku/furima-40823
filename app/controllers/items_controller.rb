class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :get_params_id, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item =Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :category_id, :condition_id, :delivery_id, :prefecture_id, :span_id, :price).merge(user_id: current_user.id)
  end

  def get_params_id
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id || Order.exists?(item_id: @item.id)
      redirect_to action: :index
    end
  end

end