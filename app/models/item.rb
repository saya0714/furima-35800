class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :history
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day


  with_options presence: true do
    validates :image
    validates :title
    validates :text
  
    with_options format: { with: /\A[0-9]+\z/, } do
    validates :price, numericality: { greater_than: 299, less_than: 10000000 }
    end
    end
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
   end
   end

