defmodule Config do
  @default_port 4000
  @moduledoc "Config helper"
  @type t :: %{port: integer(), host: String.t()}

  @spec new(keyword()) :: t()
  def new(opts \\ []) do
    %{port: Keyword.get(opts, :port, @default_port), host: Keyword.get(opts, :host, "localhost")}
  end

  @doc "Returns the URL"
  @spec url(t()) :: String.t()
  def url(%{host: h, port: p}), do: "http://#{h}:#{p}"

  def __info__(:default_port), do: @default_port
end

IO.puts(Config.url(Config.new(port: 8080)))
IO.puts(Config.url(Config.new()))
IO.inspect(Config.__info__(:default_port))
IO.inspect(function_exported?(Config, :url, 1))
