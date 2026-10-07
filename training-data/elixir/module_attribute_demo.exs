defmodule Config do
  @moduledoc "Compile-time constants via module attributes."

  @pi 3.14159
  @names ["a", "b", "c"]
  @started_at System.system_time(:second)

  Module.register_attribute(__MODULE__, :tag, accumulate: true)
  @tag :first
  @tag :second

  @doc "Area of a circle"
  def area(r), do: @pi * r * r

  def names, do: @names
  def tags, do: @tag
  def started?, do: @started_at > 0
end

IO.inspect(Config.area(2))
IO.inspect(Config.names())
IO.inspect(Config.tags())
IO.inspect(Config.started?())
