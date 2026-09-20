module Observer
  abstract def update(value : Int32)
end

class TemperatureDisplay
  include Observer

  def initialize(@name : String)
  end

  def update(value : Int32)
    puts "#{@name}: temperature is now #{value}"
  end
end

class WeatherStation
  def initialize
    @observers = [] of Observer
  end

  def subscribe(observer : Observer)
    @observers << observer
  end

  def set_temperature(value : Int32)
    @observers.each(&.update(value))
  end
end

station = WeatherStation.new
station.subscribe(TemperatureDisplay.new("sensor-a"))
station.subscribe(TemperatureDisplay.new("sensor-b"))
station.set_temperature(25)
