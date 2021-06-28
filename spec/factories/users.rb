FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {'1q1q1q'}
    password_confirmation {'1q1q1q'}
    last_name             {'漢字'}
    first_name            {'漢字'}
    last_name_kana        {'カタカナ'}
    first_name_kana       {'カタカナ'}
    birthday              {'1991-01-01'}
  end
end