class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
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

  # def edit
  #   @item = Item.find(params[:id])
  # end

  

  
  private

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
