require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end
  describe 'ショップ新規登録' do
    
    it "email, password, password_confirmation, shop_name, administrator, postal, prefecture_id, address, nearest_station, genre_id, phone_numberがあれば登録できる" do
      expect(@shop).to be_valid
    end

    it "emailが空では登録できない" do
      @shop.email = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include("メールアドレスを入力してください" )
    end

    it "passwordが空では登録できない" do
      @shop.password = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "パスワードを入力してください" 
    end

    it "shop名が空では登録できない" do
      @shop.shop_name = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "店舗名を入力してください" 
    end
    it "administratorが空では登録できない" do
      @shop.administrator = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "管理者を入力してください" 
    end
    it "postalが空では登録できない" do
      @shop.postal = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "郵便番号を入力してください" 
    end
    it "prefecture_idが空では登録できない" do
      @shop.prefecture_id = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "都道府県を入力してください" 
    end
    it "addressが空では登録できない" do
      @shop.address = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "住所を入力してください" 
    end
    it "nearest_stationが空では登録できない" do
      @shop.nearest_station = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "最寄り駅を入力してください" 
    end

    it "genre_idが空では登録できない" do
      @shop.genre_id = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "ジャンルを入力してください" 
    end
    it "phone_numberが空では登録できない" do
      @shop.phone_number = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "電話番号を入力してください" 
    end
    it "password_confirmationが空では登録できない" do
      @shop.password_confirmation = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordが5文字以下では登録できない" do
      @shop.password = "abc1"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordは英字と数字を両方含まなければ登録できない" do
      @shop.password = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("パスワードは英字と数字の両方を含めての入力が必要です")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @shop.password = "abc123"
      @shop.password_confirmation = "abc124"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "emailに@が含まれないと登録できない" do
      @shop.email = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("メールアドレスは不正な値です")
    end 
    it "administratorは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.administrator = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("管理者は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end
    it "postalにハイフンが含まれないと登録できない" do
      @shop.postal = "1234567"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("郵便番号はハイフンを含む7桁の半角数字での入力が必要です")
    end 
    it "postalは半角の数字でないと登録できない" do
      @shop.postal = "１２３４５６７"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("郵便番号はハイフンを含む7桁の半角数字での入力が必要です")
    end
    it "nearest_stationは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.nearest_station = "station"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("最寄り駅は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end

    it "phone_numberにハイフンが含まれないと登録できない" do
      @shop.phone_number = "09012345678"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("電話番号は不正な値です")
    end 

    it "phone_numberが12桁以上だと登録できない" do
      @shop.phone_number = "090-1234-56789"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("電話番号は不正な値です")
    end 

    it "buildingは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.building = "station"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("建物名は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end

    
  end
end


