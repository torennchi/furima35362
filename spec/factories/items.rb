FactoryBot.define do
  factory :item do
    product_name {"あああ"}
    text {"あああ"}
    area_id {2}
    category_id {2}
    cost_id {2}
    shipping_day_id {2}
    status_id {2}
    price {2000}
    association :user
  end
end