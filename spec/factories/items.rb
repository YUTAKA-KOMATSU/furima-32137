FactoryBot.define do
  factory :item do
    name          {Faker::Name.initials(number: 2)}
    price          {"10000"}     
    introduction      {Faker::Lorem.sentence}  
    category_id       {"2"}
    state_id          {"2"}
    burden_of_delivery_id    {"2"}
    prefecture_id            {"2"}
    shipment_date_id         {"2"}            
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
