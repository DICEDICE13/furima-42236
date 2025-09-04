class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(
      :postal_code, 
      :prefecture_id, 
      :city, 
      :address_line, 
      :building_name, 
      :phone_number,
      :token
            
      
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id],
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    Payjp::Charge.create(
       amount: @item.price,  
       card: order_form_params[:token],    
       currency: 'jpy'                 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
