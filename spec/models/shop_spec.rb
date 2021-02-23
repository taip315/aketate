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
      expect(@shop.errors.full_messages).to include("Email can't be blank" )
    end

    it "passwordが空では登録できない" do
      @shop.password = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Password can't be blank" 
    end

    it "shop名が空では登録できない" do
      @shop.shop_name = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Shop name can't be blank" 
    end
    it "administratorが空では登録できない" do
      @shop.administrator = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Administrator can't be blank" 
    end
    it "postalが空では登録できない" do
      @shop.postal = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Postal can't be blank" 
    end
    it "prefecture_idが空では登録できない" do
      @shop.prefecture_id = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Prefecture can't be blank" 
    end
    it "addressが空では登録できない" do
      @shop.address = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Address can't be blank" 
    end
    it "nearest_stationが空では登録できない" do
      @shop.nearest_station = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Nearest station can't be blank" 
    end

    it "genre_idが空では登録できない" do
      @shop.genre_id = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Genre can't be blank" 
    end
    it "phone_numberが空では登録できない" do
      @shop.phone_number = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include "Phone number can't be blank" 
    end
    it "password_confirmationが空では登録できない" do
      @shop.password_confirmation = ""
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下では登録できない" do
      @shop.password = "abc1"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは英字と数字を両方含まなければ登録できない" do
      @shop.password = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Password は英字と数字の両方を含めての入力が必要です")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @shop.password = "abc123"
      @shop.password_confirmation = "abc124"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "emailに@が含まれないと登録できない" do
      @shop.email = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Email is invalid")
    end 
    it "shop_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.shop_name = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Shop name は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end
    it "administratorは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.administrator = "abcdef"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Administrator は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end
    it "postalにハイフンが含まれないと登録できない" do
      @shop.postal = "1234567"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Postal is invalid")
    end 
    it "postalは半角の数字でないと登録できない" do
      @shop.postal = "１２３４５６７"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Postal is invalid")
    end
    it "nearest_stationは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.nearest_station = "station"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Nearest station は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end

    it "phone_numberにハイフンが含まれないと登録できない" do
      @shop.phone_number = "09012345678"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Phone number is invalid")
    end 

    it "phone_numberが12桁以上だと登録できない" do
      @shop.phone_number = "090-1234-56789"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Phone number is invalid")
    end 

    it "buildingは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @shop.building = "station"
      @shop.valid?
      expect(@shop.errors.full_messages).to include("Building は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end

    
  end
end


