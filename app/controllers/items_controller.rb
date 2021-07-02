class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
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

private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :price, :delivery_area_id, :delivery_charge_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end
end

  def set_item
    @item = Item.find(params[:id])
    end

  def root_index
    if current_user.id != @item.user_id
    redirect_to root_path 
    end
  end
