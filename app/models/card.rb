class Card < ApplicationRecord
  belongs_to :topic
  has_many :session_items, dependent: :destroy
  has_many :sessions, through: :session_items

  before_save :set_period_date

  def correct
    update!(period: period + 1)
  end

  def incorrect
    update!(period: 0)
  end

  def display_at
    self[:display_at] || Time.current
  end

  def period
    CardPeriod.new(self[:period])
  end

  def period=(value)
    @period = case value
              when CardPeriod
                value
              else
                CardPeriod.new(value)
              end

    self[:period] = @period.value
  end

  def self.valid_cards
    where('display_at IS NULL').or(where('display_at <= ?', Time.current))
  end

  private

  def display_at=(value)
    self[:display_at] = value
  end

  def set_period_date
    self[:display_at] = period.date
  end
end
