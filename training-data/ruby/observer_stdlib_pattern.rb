module Observable
  def observers = (@observers ||= [])
  def subscribe(&blk) = observers << blk
  def notify(*args) = observers.each { |o| o.call(*args) }
end

class Stock
  include Observable
  attr_reader :price
  def price=(p)
    old, @price = @price, p
    notify(old, p) if old != p
  end
end

s = Stock.new
s.subscribe { |o, n| puts "#{o.inspect} -> #{n}" }
s.price = 10
s.price = 12
s.price = 12
