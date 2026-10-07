defmodule Validators do
  defguard is_percentage(value) when is_number(value) and value >= 0 and value <= 100

  defguardp is_short_string(value) when is_binary(value) and byte_size(value) <= 10

  def classify(value) when is_percentage(value), do: :valid_percentage
  def classify(value) when is_short_string(value), do: :short_string
  def classify(_value), do: :other
end

IO.inspect(Validators.classify(75))
IO.inspect(Validators.classify(150))
IO.inspect(Validators.classify("hi"))
IO.inspect(Validators.classify("this string is way too long"))
IO.inspect(Validators.classify(:atom))
