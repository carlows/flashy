require 'rails_helper'

RSpec.describe CardPeriod do
  it 'produces the default period' do
    period = CardPeriod.new(0)

    freeze_time do
      expect(period.date).to eq(Time.current)
    end
  end

  it 'produces the first period' do
    period = CardPeriod.new(1)

    freeze_time do
      expect(period.date).to eq(1.day.from_now)
    end
  end

  context 'invalid periods' do
    it 'produces the default period' do
      period1 = CardPeriod.new('lol')
      period2 = CardPeriod.new(:invalid)

      freeze_time do
        expect(period1.date).to eq(Time.current)
        expect(period2.date).to eq(Time.current)
      end
    end
  end
end
