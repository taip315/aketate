require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'email, password, password_confirmation, nickname, first_name, last_name, first_kana, last_kana, birthday, gender_idがあれば登録できる' do
      expect(@user).to be_valid
    end

    it 'emailが空欄だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
    end

    it 'passwordが空欄だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'nicknameが空欄だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'last_nameが空欄だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を入力してください')
    end

    it 'first_nameが空欄だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it 'last_kanaが空欄だと登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（フリガナ）を入力してください')
    end

    it 'first_kanaが空欄だと登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）を入力してください')
    end

    it 'birthdayが空欄だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('誕生日を入力してください')
    end

    it 'gender_idが空欄だと登録できない' do
      @user.gender_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('性別を入力してください')
    end

    it 'phone_numberが空欄だと登録できない' do
      @user.phone_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('電話番号を入力してください', '電話番号は半角数字での入力が必要です')
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'abc1'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordは英字と数字を両方含まなければ登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めての入力が必要です')
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc124'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'emailに@が含まれないと登録できない' do
      @user.email = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
    end
    it 'last_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない' do
      @user.last_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は全角（漢字、ひらがな、カタカナ）での入力が必要です')
    end
    it 'first_nameは全角（漢字、ひらがな、カタカナ）でなければ登録できない' do
      @user.first_name = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は全角（漢字、ひらがな、カタカナ）での入力が必要です')
    end
    it 'last_kanaは全角カタカナでなければ登録できない' do
      @user.last_kana = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（フリガナ）は全角カタカナでの入力が必要です')
    end
    it 'first_kanaは全角カタカナでなければ登録できない' do
      @user.first_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）は全角カタカナでの入力が必要です')
    end
    it 'birthdayは半角の数字でなければ登録できない' do
      @user.birthday = '１９９０-０９-０９'
      @user.valid?
      expect(@user.errors.full_messages).to include('誕生日を入力してください')
    end
    it 'phone_numberにハイフンが含まれないと登録できない' do
      @user.phone_number = '09012345678'
      @user.valid?
      expect(@user.errors.full_messages).to include('電話番号は半角数字での入力が必要です')
    end

    it 'phone_numberが12桁以上だと登録できない' do
      @user.phone_number = '090-1234-56789'
      @user.valid?
      expect(@user.errors.full_messages).to include('電話番号は半角数字での入力が必要です')
    end
  end
end
