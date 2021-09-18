FactoryBot.define do
  factory :buy_shipping_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city             { '大分県' }
    address          { '1-111' }
    building_name    { 'ボロビル' }
    phone_number     { '07014823455' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end