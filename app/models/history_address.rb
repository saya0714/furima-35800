class HistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city_name, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :delivery_area_id, numericality: { other_than: 1 } 
    validates :city_name
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\Z/ }
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city_name: city_name, address: address, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end