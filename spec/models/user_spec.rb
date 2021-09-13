require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
     end
     it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
     end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
     end
     it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
     end
     it "surnameが空では登録できない" do
        @user.surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(全角)を入力してください")
     end
     it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください")
     end
     it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
     end
     it "kana_surnameが空では登録できない" do
        @user.kana_surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ(全角)を入力してください")
     end
     it "kana_nameが空では登録できない" do
        @user.kana_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください")
     end
     it "メールアドレスが一意性である" do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "メールアドレスは、@を含む必要がある" do
        @user.email = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "パスワードは、確認用を含めて2回入力する" do
        @user.password = "0000aa"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "surnameは、全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.surname = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(全角)は全角（漢字・ひらがな・カタカナ）を入力してください")
      end
      it "nameは、全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.name = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)は全角（漢字・ひらがな・カタカナ）を入力してください")
      end
      it "kana_surnameは、全角（カタカナ）での入力が必須である" do
        @user.kana_surname = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ(全角)は全角（カタカナ）を入力してください")
      end
      it "kana_nameは、全角（カタカナ）での入力が必須である" do
        @user.kana_name = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は全角（カタカナ）を入力してください")
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