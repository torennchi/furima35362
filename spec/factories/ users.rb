FactoryBot.define do
  factory :user do
    nickname {"abe"}
    email {Faker::Internet.free_email}
    password {"aaa0000"}
    password_confirmation {password}
    birthday {"1993-02-03"}
    surname {"あ"}
    name {"あ"}
    kana_surname {"ア"}
    kana_name {"ア"}
  end
 end