class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :setting_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @history_address = HistoryAddress.new
  end

  def create
    @history_address = HistoryAddress.new(history_params)
    if @history_address.valid?
       pay_item
       @history_address.save
       redirect_to root_path
    else
      render :index
    end
  end
end

private
  def history_params
    params.require(:history_address).permit(:postal_code, :delivery_area_id, :city_name, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end
      
  def setting_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy' 
    )
  end

  def sold_out_item
    redirect_to root_path if current_user_id == @item.user_id || @item.history != nil
   end
  
  
  