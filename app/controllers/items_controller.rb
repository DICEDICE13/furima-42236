class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authorize_owner!, only: [:edit, :update]
 

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def new
    @item = Item.new
    set_select_options
  end

  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      set_select_options
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_select_options
  end

  def update
    safe_params =
      if params[:item].key?(:image) && params[:item][:image].blank?
        item_params.except(:image)
      else
        item_params
      end
      
    if @item.update(safe_params)
      redirect_to item_path(@item), notice: '商品情報を更新しました'
    else
      set_select_options
      render :edit, status: :unprocessable_entity
    end
  end

  

  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_owner!
    return if current_user == @item.user
    redirect_to root_path, alert: '権限がありません'
  end

  
  

  def item_params
  params.require(:item).permit(
    :image, :name, :description, :category_id, :status_id,
    :shipping_fee_status_id, :prefecture_id, :delivery_day_id, :price
  ).merge(user_id: current_user.id)
  end

  def set_select_options
    @categories = Category.all
    @statuses = Status.all
    @shipping_fee_statuses = ShippingFeeStatus.all
    @prefectures = Prefecture.all
    @delivery_days = DeliveryDay.all
  end

  

end
