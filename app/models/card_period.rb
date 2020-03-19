class CardPeriod
  attr_reader :period

  def initialize(period)
    @period = period

    validate_period
  end

  def date
    @period.days.from_now
  end

  def +(other)
    CardPeriod.new(@period + other)
  end

  def value
    @period
  end

  private

  def validate_period
    Integer(@period)
  rescue StandardError
    @period = 0
  end
end
