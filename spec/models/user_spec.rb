require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "email, password, password_confirmation, nickname, first_name, last_name, first_kana, last_kana, birthday, gender_idがあれば登録できる" do
      expect(@user).to be_valid
    end

    it "emailが空欄だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空欄だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "nicknameが空欄だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "last_nameが空欄だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空欄だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_kanaが空欄だと登録できない" do
      @user.last_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
   
    it "first_kanaが空欄だと登録できない" do
      @user.first_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end

    it "birthdayが空欄だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "gender_idが空欄だと登録できない" do
      @user.gender_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Gender can't be blank")
    end

    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下では登録できない" do
      @user.password = "abc1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは英字と数字を両方含まなければ登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英字と数字の両方を含めての入力が必要です")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password = "abc123"
      @user.password_confirmation = "abc124"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "emailに@が含まれないと登録できない" do
      @user.email = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "last_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @user.last_name = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end
    it "first_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
      @user.first_name = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角（漢字、ひらがな、カタカナ）での入力が必要です")
    end
    it "last_kanaは全角カタカナでなければ登録できない" do
      @user.last_kana = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana は全角カタカナでの入力が必要です")
    end
    it "first_kanaは全角カタカナでなければ登録できない" do
      @user.first_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana は全角カタカナでの入力が必要です")
    end
    it "birthdayは半角の数字でなければ登録できない" do
      @user.birthday = "１９９０-０９-０９"
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday is invalid")
    end
    it "phone_numberにハイフンが含まれないと登録できない" do
      @user.phone_number = "09012345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number is invalid")
    end 

    it "phone_numberが12桁以上だと登録できない" do
      @user.phone_number = "090-1234-56789"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number is invalid")
    end 

  end
end
