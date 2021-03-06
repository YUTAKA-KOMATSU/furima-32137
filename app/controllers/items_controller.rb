class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
    @item = Item.find(params[:id])
    if @item.purchase != nil
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id] )
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == @item.user_id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :state_id, :burden_of_delivery_id, :prefecture_id, :shipment_date_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
