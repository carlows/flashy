class SessionItem < ApplicationRecord
  belongs_to :session
  belongs_to :card
end
