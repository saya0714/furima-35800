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
    validates :title
    validates :text
    validates :category
    validates :status
    validates :delivery_charge
    validates :delivery_area
    validates :delivery_day
    with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { greater_than: 300, less_than: 9999999 }
      end
    end
end
