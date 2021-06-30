require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
  end

  context'商品出品できるとき' do
    it '全てが実行するとき' do
    expect(@item).to be_valid
    end
    end
  context'商品出品できないとき' do  
    it "titleが空だと登録できない" do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "textが空だと登録できない" do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "status_idが空だと登録できない" do
     @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "delivery_charge_idが空だと登録できない" do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
    end
      it "delivery_area_idが空だと登録できない" do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
    end
      it "delivery_day_idが空だと登録できない" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end
      it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "priceの価格が３００以下だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "priceの価格が9,999,999異常だと登録できない" do
        @item.price = '1,111,111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceの価格が半角数字以外では登録できない" do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "みでは登録できない" do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    
    end
  end
end
