require 'rails_helper'

RSpec.describe CreateSessionItemOutcome do
  it 'updates the outcome of the session item' do
    session_item = create(:session_item)

    CreateSessionItemOutcome.execute(
      session_item_id: session_item.id,
      outcome: 'correct'
    )
    session_item.reload

    expect(session_item.outcome).to eq('correct')
  end

  it 'throws an exception if session item is invalid' do
    expect {
      CreateSessionItemOutcome.execute(
        session_item_id: 'invalid',
        outcome: 'correct'
      )
    }.to raise_error(ActiveRecord::RecordNotFound)
  end

  context 'correct outcome' do
    it 'should increase the period by one in card' do
      freeze_time do
        card = create(:card, period: 0)
        session_item = create(:session_item, card: card)

        CreateSessionItemOutcome.execute(
          session_item_id: session_item.id,
          outcome: 'correct'
        )
        card.reload

        expect(card.period.value).to eq(1)
      end
    end
  end

  context 'incorrect outcome' do
    it 'should reset display_at' do
      freeze_time do
        card = create(:card, period: 1)
        session_item = create(:session_item, card: card)

        CreateSessionItemOutcome.execute(
          session_item_id: session_item.id,
          outcome: 'incorrect'
        )
        card.reload

        expect(card.period.value).to eq(0)
      end
    end
  end
end
