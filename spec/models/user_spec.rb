require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = User.new(nickname: "", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"あ",name:"あ",kana_surname:"ア",kana_name:"ア")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       user = User.new(nickname: "abe", email: "", password: "aaa0000", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"あ",name:"あ",kana_surname:"ア",kana_name:"ア")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"あ",name:"あ",kana_surname:"ア",kana_name:"ア")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "", birthday:"2000.10.10", surname:"あ",name:"あ",kana_surname:"ア",kana_name:"ア")
      user.valid?
      
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
     end
     it "surnameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"",name:"あ",kana_surname:"ア",kana_name:"ア")
      user.valid?
      expect(user.errors.full_messages).to include("Surname can't be blank")
     end
     it "nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"あ",name:"",kana_surname:"ア",kana_name:"ア")
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
     end
     it "birthdayが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "aaa0000", birthday:"", surname:"あ",name:"あ",kana_surname:"",kana_name:"ア")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
     it "kana_surnameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"あ",name:"あ",kana_surname:"",kana_name:"ア")
      user.valid?
      expect(user.errors.full_messages).to include("Kana surname can't be blank")
     end
     it "kana_nameが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "aaa0000", password_confirmation: "aaa0000", birthday:"2000.10.10", surname:"あ",name:"",kana_surname:"ア",kana_name:"")
      user.valid?
      expect(user.errors.full_messages).to include("Kana name can't be blank")
     end
   end

 end