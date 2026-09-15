defmodule WeatherStation do
  use Agent

  def start_link(_opts \\ []) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def subscribe(observer_fun) do
    Agent.update(__MODULE__, fn observers -> [observer_fun | observers] end)
  end

  def set_temperature(value) do
    Agent.get(__MODULE__, & &1)
    |> Enum.each(fn observer -> observer.(value) end)
  end
end

{:ok, _pid} = WeatherStation.start_link()

WeatherStation.subscribe(fn temp -> IO.puts("sensor-a: temperature is now #{temp}") end)
WeatherStation.subscribe(fn temp -> IO.puts("sensor-b: temperature is now #{temp}") end)

WeatherStation.set_temperature(25.5)
