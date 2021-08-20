require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
     end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "surnameが空では登録できない" do
        @user.surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
     end
     it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
     end
     it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     it "kana_surnameが空では登録できない" do
        @user.kana_surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana surname can't be blank")
     end
     it "kana_nameが空では登録できない" do
        @user.kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name can't be blank")
     end
     it "メールアドレスが一意性である" do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは、@を含む必要がある" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは、確認用を含めて2回入力する" do
        @user.password = "0000aa"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "surnameは、全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.surname = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid. Input full-width characters.")
      end
      it "nameは、全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.name = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
      end
      it "kana_surnameは、全角（カタカナ）での入力が必須である" do
        @user.kana_surname = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana surname is invalid.")
      end
      it "kana_nameは、全角（カタカナ）での入力が必須である" do
        @user.kana_name = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name is invalid.")
      end
   end
  context "新規登録できる時" do
    it "パスワードは、半角英数字混合での入力が必須である" do
      @user.password = "0000aa"
      @user.password_confirmation = "0000aa"
      expect(@user).to be_valid
    end
    it "全ての項目が入力されていれば登録できる" do
      expect(@user).to be_valid
    end
  end
end