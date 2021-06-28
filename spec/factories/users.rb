FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {'000000'}
    last_name             {'漢字'}
    first_name            {'漢字'}
    last_name_kana        {'カタカナ'}
    first_name_kana       {'カタカナ'}
    birthday              {'1991-01-01'}
  end
end