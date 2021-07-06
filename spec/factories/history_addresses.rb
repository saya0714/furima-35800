FactoryBot.define do
  factory :history_address do
    token            {'test_00000000000000000'}
    postal_code      {'123-1234'}
    delivery_area_id {2}
    city_name        {'横浜市緑区'}
    address          {'1-1-1'}
    building_name    {'柳ビル'}
    phone_number      {'09011112222'}
    
   
    
  end
end
