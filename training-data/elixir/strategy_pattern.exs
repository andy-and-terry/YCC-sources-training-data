defmodule DiscountStrategy do
  def no_discount(total), do: total

  def percentage(percent) do
    fn total -> total - total * percent / 100.0 end
  end

  def flat(amount) do
    fn total -> max(total - amount, 0.0) end
  end
end

defmodule Cart do
  def checkout(total, strategy), do: strategy.(total)
end

IO.inspect(Cart.checkout(100.0, &DiscountStrategy.no_discount/1))
IO.inspect(Cart.checkout(100.0, DiscountStrategy.percentage(20.0)))
IO.inspect(Cart.checkout(100.0, DiscountStrategy.flat(15.0)))
