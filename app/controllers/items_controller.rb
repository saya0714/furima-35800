class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_tweet, only: [:edit, :show]


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
    @item = Item.find(params[:id])
    end

  def update
    if item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

  def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
     redirect_to root_path 
    else
      render :edit
    end
    end



private
def item_params
  params.require(:item).permit(:title, :text, :category_id, :status_id, :price, :delivery_area_id, :delivery_charge_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end
end

def set_tweet
  @item = Item.find(params[:id])
end