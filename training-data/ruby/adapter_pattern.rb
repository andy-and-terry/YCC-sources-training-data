class LegacyWeatherStation
  def temperature_celsius
    21.5
  end
end

class FahrenheitAdapter
  def initialize(station)
    @station = station
  end

  def temperature_fahrenheit
    @station.temperature_celsius * 9.0 / 5 + 32
  end
end

def report_temperature(source)
  puts "Current temperature: #{source.temperature_fahrenheit.round(1)}F"
end

station = LegacyWeatherStation.new
report_temperature(FahrenheitAdapter.new(station))
