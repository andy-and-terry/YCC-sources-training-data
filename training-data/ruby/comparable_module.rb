class Money
  include Comparable
  attr_reader :cents

  def initialize(cents)
    @cents = cents
  end

  def <=>(other)
    cents <=> other.cents
  end

  def to_s
    format('$%.2f', cents / 100.0)
  end
end

prices = [Money.new(500), Money.new(150), Money.new(999)]
puts prices.sort.map(&:to_s).inspect
puts prices.max.to_s
