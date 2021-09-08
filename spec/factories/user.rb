FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 6) }
    email                  { Faker::Internet.free_email }
    password               { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    family_name            {'山田'}
    first_name             {'正志'}
    family_name_kana       {'ヤマダ'}
    first_name_kana        {'マサシ'}
    birthday               {'1995-11-06'}
  end
end