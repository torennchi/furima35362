FactoryBot.define do
  factory :buyer_record_address do
    postal_code       {"123-4567"}
    area_id {12}
    municipalities   {"館山市"}
    address    {"1-1"}
    phone_number    {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
