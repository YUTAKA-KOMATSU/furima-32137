FactoryBot.define do
  factory :item_purchase do
    postal_code { '123-4567' }
    prefecture_id {2}
    municipality { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '横浜ハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
