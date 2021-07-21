class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :comments
  has_one :history
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day
  has_many_attached :images


  with_options presence: true do
    validates :images
    validates :title
    validates :text
  
    with_options format: { with: /\A[0-9]+\z/, } do
    validates :price, numericality: { greater_than: 299, less_than: 10000000 }
    end
    end
    with_options numericality: { other_than: 1, message: ' -- 以外を入力してください' } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
   end
   end

