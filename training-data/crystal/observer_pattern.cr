module Observer
  abstract def update(event : String) : Nil
end

class EventPublisher
  def initialize
    @observers = [] of Observer
  end

  def subscribe(observer : Observer) : Nil
    @observers << observer
  end

  def publish(event : String) : Nil
    @observers.each(&.update(event))
  end
end

class LoggingObserver
  include Observer

  def update(event : String) : Nil
    puts "[log] #{event}"
  end
end

class CountingObserver
  include Observer

  getter count : Int32 = 0

  def update(event : String) : Nil
    @count += 1
  end
end

publisher = EventPublisher.new
logger = LoggingObserver.new
counter = CountingObserver.new

publisher.subscribe(logger)
publisher.subscribe(counter)

publisher.publish("user_signed_up")
publisher.publish("user_logged_in")

puts "events seen: #{counter.count}"
