# Adapts a legacy Celsius-only weather source to the Fahrenheit-based
# interface newer client code expects, without touching either side.
legacy_weather_station <- function() {
  list(get_temperature_celsius = function() 21.5)
}

fahrenheit_adapter <- function(station) {
  list(get_temperature_fahrenheit = function() {
    station$get_temperature_celsius() * 9 / 5 + 32
  })
}

report_temperature <- function(source) {
  cat(sprintf("Current temperature: %.1fF\n", source$get_temperature_fahrenheit()))
}

station <- legacy_weather_station()
adapted <- fahrenheit_adapter(station)
report_temperature(adapted)
