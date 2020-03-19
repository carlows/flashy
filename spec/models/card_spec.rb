require 'rails_helper'

RSpec.describe Card, type: :model do
  context '#period' do
    it 'should create a CardPeriod object' do
      card = create(:card)

      expect(card.period).to be_a(CardPeriod)
    end
  end

  it 'should set the display_at on create' do
    freeze_time do
      card = create(:card, period: 1)
      expect(card.display_at).to eq(1.day.from_now)
    end
  end

  it 'should set the display_at when updating period' do
    card = create(:card)

    freeze_time do
      card.update(period: 2)
      card.reload

      expect(card.display_at).to eq(2.days.from_now)
    end
  end
end
