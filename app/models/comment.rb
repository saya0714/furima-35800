class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user 

  validates :text, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])|[a-zA-Z0-9]+\z/}
end
