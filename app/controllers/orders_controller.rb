class OrdersController < ApplicationController
  def index
    @oreder_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
      params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
