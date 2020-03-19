module CreateSession
  def self.execute(cards:, user:)
    ActiveRecord::Base.transaction do
      cards = Card.valid_cards.take(cards)
      session = Session.create!(user: user)

      cards.each do |card|
        session.session_items.create!(card: card)
      end

      session
    end
  end
end
