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
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it "textが空だと登録できない" do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
    end
    it "status_idが空だと登録できない" do
     @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
    end
    it "delivery_charge_idが空だと登録できない" do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
    end
      it "delivery_area_idが空だと登録できない" do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元の地域は1以外の値にしてください")
    end
      it "delivery_day_idが空だと登録できない" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
    end
      it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("写真を入力してください")
      end
      it "priceの価格が３００以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は299より大きい値にしてください")
      end
      it "priceの価格が9,999,999以上だと登録できない" do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は不正な値です")
      end
      it "priceの価格が半角数字以外では登録できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "priceの価格が半角英数字混合では登録できない" do
        @item.price = "1a1a"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "紐づくユーザーがいないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end

    end
  end
end
