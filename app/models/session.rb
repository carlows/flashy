class Session < ApplicationRecord
  belongs_to :user
  has_many :session_items, dependent: :destroy
  has_many :cards, through: :session_items
end
