class CreateSessionItemOutcome
  def self.execute(session_item_id:, outcome:)
    ActiveRecord::Base.transaction do
      item = SessionItem.find(session_item_id)
      item.update(outcome: outcome)

      item.card.public_send(outcome.to_sym)
    end
  end
end
