class OrderForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city,
                :address_line, :building_name, :phone_number,
                :item_id, :user_id, :token 

   with_options presence: true do
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :token
    validates :user_id
    validates :item_id
    
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)

      # 配送先情報を保存
      ShippingAddress.create(
        postal_code: postal_code,
        prefecture_id: prefecture_id,
        city: city,
        address_line: address_line,
        building_name: building_name,
        phone_number: phone_number,
        order_id: order.id
      )
  end
end