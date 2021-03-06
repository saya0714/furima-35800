require 'rails_helper'

RSpec.describe HistoryAddress, type: :model do
  describe '商品購入保存機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.3
      @history_address = FactoryBot.build(:history_address, user_id: user.id, item_id: item.id)
  end
  context'購入情報保存できる時' do
    it '全てが実行するとき' do
    expect(@history_address).to be_valid
    end
    it '建物名は空でも登録できる' do
      @history_address.building_name = ''
      expect(@history_address).to be_valid
      end
    end
    context'購入情報保存できない時' do  
      it "郵便番号が空だと登録できない" do
        @history_address.postal_code = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "郵便番号がハイフンがないと登録できない" do
        @history_address.postal_code = '1231234'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it "都道府県が空だと登録できない" do
        @history_address.delivery_area_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it "市区町村が空だと登録できない" do
        @history_address.city_name = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it "電話番号が空だと登録できない" do
        @history_address.phone_number = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("電話番号を入力してください")
       end
       it "電話番号が10桁、11桁でないと登録できない" do
        @history_address.phone_number = '000111122222'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("電話番号は不正な値です")
       end
       it "user_id空だと登録できない" do
        @history_address.user_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("ユーザー情報を入力してください")
       end
       it "item_id空だと登録できない" do
        @history_address.item_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("商品情報を入力してください")
       end
       it "電話番号が英数混合だと登録できない" do
        @history_address.phone_number = "00a000a000a"
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("電話番号は不正な値です")
       end
       it "番地が空だと登録できない" do
        @history_address.address = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("番地を入力してください")
      end
end
end
end
