defmodule DiscountStrategy do
  @callback calculate(number()) :: number()
end

defmodule NoDiscount do
  @behaviour DiscountStrategy

  @impl true
  def calculate(total), do: total
end

defmodule PercentageDiscount do
  @behaviour DiscountStrategy

  @impl true
  def calculate(total), do: total - total * 0.2
end

defmodule FlatDiscount do
  @behaviour DiscountStrategy

  @impl true
  def calculate(total), do: max(total - 15.0, 0.0)
end

defmodule Cart do
  def checkout(total, strategy), do: apply(strategy, :calculate, [total])
end

IO.inspect(Cart.checkout(100.0, NoDiscount))
IO.inspect(Cart.checkout(100.0, PercentageDiscount))
IO.inspect(Cart.checkout(100.0, FlatDiscount))
