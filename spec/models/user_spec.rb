require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
  end

  context'新規登録できるとき' do
    it '全てが実行するとき' do
    expect(@user).to be_valid
    end
    end
    context'新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it "emailに@がないと登録できない" do
      @user.email = "agmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end
    it "重複したemailが存在すれば登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordが半角英字でなければ登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには半角の英字と数字の両方を含めて設定してください")
    end
    it 'passwordが半角数字でなければ登録できないこと' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには半角の英字と数字の両方を含めて設定してください")
    end
    it 'passwordが全角であると登録できないこと' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include( "パスワードには半角の英字と数字の両方を含めて設定してください")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "名字が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を漢字を入力してください")
    end
    it "名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を漢字を入力してください")
    end
    it "名字が半角文字では登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を漢字を入力してください")
    end
    it "名前が半角文字では登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を漢字を入力してください")
    end
    it "カタカナ(名字)が空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字をカタカナを入力してください")
    end
    it "名前が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前をカタカナを入力してください")
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "名字のフリガナは全角(ひらがな)では登録できない" do
        @user.last_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字をカタカナを入力してください")
      end
      it "名前のフリガナは全角(ひらがな)では登録できない" do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前をカタカナを入力してください")
      end
    end
  end
end

