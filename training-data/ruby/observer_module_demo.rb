require "observer"

class Ticker
  include Observable

  def update_price(price)
    changed
    notify_observers(Time.at(0).utc.year, price)
  end
end

class Logger
  def initialize(name)
    @name = name
  end

  def update(year, price)
    puts "#{@name}: #{year} price=#{price}"
  end
end

ticker = Ticker.new
a = Logger.new("A")
b = Logger.new("B")
ticker.add_observer(a)
ticker.add_observer(b)
ticker.update_price(10)
ticker.delete_observer(a)
ticker.update_price(12)
puts ticker.count_observers
