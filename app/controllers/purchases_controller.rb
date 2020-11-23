class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase == nil
      @item_purchase = ItemPurchase.new
    else
      redirect_to root_path
    end
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy' 
      )
  end
end
