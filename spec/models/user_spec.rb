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
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がないと登録できない" do
      @user.email = "agmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在すれば登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字でなければ登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名字が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名字が半角文字では登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name を入力してください")
    end
    it "名前が半角文字では登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name を入力してください")
    end
    it "カタカナ(名字)が空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "名前が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名字のフリガナは全角(カタカナ)でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name を入力してください")
    end
    it "名前のフリガナは全角(カタカナ)でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name を入力してください")
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

