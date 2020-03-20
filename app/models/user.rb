class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :sessions, dependent: :destroy
end
