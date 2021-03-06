require 'rails_helper'

RSpec.describe CreateSession do
  it 'creates a Session' do
    user = create(:user)

    expect do
      CreateSession.execute(cards: 1, user: user)
    end.to change { Session.count }.by(1)
    expect(Session.first.user).to eq(user)
  end

  it 'returns a Session' do
    user = create(:user)

    session = CreateSession.execute(cards: 1, user: user)

    expect(session).to be_a(Session)
  end

  it 'picks x cards' do
    user = create(:user)
    create_list(:card, 10)

    expect do
      CreateSession.execute(cards: 1, user: user)
    end.to change { SessionItem.count }.by(1)
  end

  it 'does not select invalid cards' do
    user = create(:user)
    create(:card, period: 1)

    expect do
      CreateSession.execute(cards: 1, user: user)
    end.not_to(change { SessionItem.count })
  end
end
