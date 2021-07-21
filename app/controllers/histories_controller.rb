class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :setting_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @history_address = HistoryAddress.new
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    
    else
      redirect_to new_card_path
  end
    end


  def create
    @history_address = HistoryAddress.new(history_params)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @card = Card.find_by(user_id: current_user.id)
  
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
    params.require(:history_address).permit(:postal_code, :delivery_area_id, :city_name, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
      
  def setting_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    if @card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy' 
    )
    end
  end

  def sold_out_item
    redirect_to root_path if current_user.id == @item.user_id || @item.history != nil
   end
  
  
  