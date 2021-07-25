FactoryBot.define do
  factory :item do
    title               {Faker::Name.initials}
    text                {Faker::Lorem.sentence}
    category_id         {2}
    status_id           {2}
    delivery_charge_id  {2}
    delivery_area_id    {2}
    delivery_day_id     {2}
    price               {1111}
    
    association :user

    after(:build) do |message|
      message.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
