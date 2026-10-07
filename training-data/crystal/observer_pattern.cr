module Observer
  abstract def on_update(temperature : Float64)
end

class ConsoleObserver
  include Observer

  def initialize(@name : String)
  end

  def on_update(temperature : Float64)
    puts "#{@name}: temperature is now #{temperature}"
  end
end

class WeatherStation
  def initialize
    @observers = [] of Observer
  end

  def subscribe(observer : Observer)
    @observers << observer
  end

  def set_temperature(value : Float64)
    @observers.each(&.on_update(value))
  end
end

station = WeatherStation.new
station.subscribe(ConsoleObserver.new("sensor-a"))
station.subscribe(ConsoleObserver.new("sensor-b"))
station.set_temperature(25.5)
