defmodule Config do
  @moduledoc "Shows compile-time module attributes."

  @default_port 4000
  @allowed_envs [:dev, :test, :prod]
  @compiled_at "build-1"

  @doc "Returns the default port."
  def port, do: @default_port

  def valid_env?(env), do: env in @allowed_envs

  def info, do: %{port: @default_port, envs: @allowed_envs, build: @compiled_at}

  Module.register_attribute(__MODULE__, :history, accumulate: true)
  @history :a
  @history :b
  def history, do: @history
end

IO.inspect(Config.port())
IO.inspect(Config.valid_env?(:prod))
IO.inspect(Config.valid_env?(:staging))
IO.inspect(Config.info())
IO.inspect(Config.history())
IO.inspect(Config.__info__(:functions) |> Enum.sort())
