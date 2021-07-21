class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy, :history]
  before_action :root_index, only: [:edit, :update, :destroy]



  def index
    @items = Item.order(created_at: "DESC")
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path    
    else
      render :new
  end
end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order(created_at: "DESC")
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy

    if @item.user_id == current_user.id
    @item.destroy
    redirect_to root_path
  end
end

def order
  redirect_to new_card_path and return unless current_user.card.present?

  Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
  customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
  Payjp::Charge.create(
    amount: @item.price, # 商品の値段
    customer: customer_token, # 顧客のトークン
    currency: 'jpy' # 通貨の種類（日本円）
  )
  ItemOrder.create(item_id: params[:id])
  redirect_to root_path
end

private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :price, :delivery_area_id, :delivery_charge_id, :delivery_day_id, images: []).merge(user_id: current_user.id)
  end
end

  def set_item
    @item = Item.find(params[:id])
    end

  def root_index
    if current_user.id != @item.user_id || @item.history != nil
    redirect_to root_path 
    end
  end
