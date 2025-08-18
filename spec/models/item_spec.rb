describe '商品出品機能' do
  context '出品できるとき' do
    it 'すべての項目が適切に入力されていれば出品できる' do
      expect(@item).to be_valid
    end

    it 'ユーザーが存在すれば出品できる' do
      @item.user = FactoryBot.create(:user)
      expect(@item).to be_valid
    end
  end

  context '出品できないとき' do
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが10000000以上では出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceが全角数字では出品できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'category_idが1（---）では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが1（---）では出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'shipping_fee_status_idが1（---）では出品できない' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
    end

    it 'prefecture_idが1（---）では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'scheduled_delivery_idが1（---）では出品できない' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
    end

    it 'ユーザーが紐づいていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end