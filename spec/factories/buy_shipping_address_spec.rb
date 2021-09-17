FactoryBot.define do
  factory :buy_shipping_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city             { '福岡県' }
    address          { '1-1' }
    building_name    { 'ボロビル' }
    phone_number     { '07014823455' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end