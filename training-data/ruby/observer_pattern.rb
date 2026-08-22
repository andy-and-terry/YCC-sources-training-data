module Observable
  def observers
    @observers ||= []
  end

  def subscribe(&block)
    observers << block
  end

  def notify(*args)
    observers.each { |o| o.call(*args) }
  end
end

class TemperatureSensor
  include Observable

  def set_temperature(value)
    notify(value)
  end
end

sensor = TemperatureSensor.new
sensor.subscribe { |t| puts "Alert: temperature is now #{t}" }
sensor.set_temperature(25.5)
