class Money
  include Comparable
  attr_reader :cents

  def initialize(cents) = @cents = cents
  def <=>(other) = cents <=> other.cents
  def to_s = format("$%.2f", cents / 100.0)
end

list = [Money.new(500), Money.new(150), Money.new(999)]
puts list.min, list.max, Money.new(200).between?(list.min, list.max)
