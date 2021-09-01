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


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end