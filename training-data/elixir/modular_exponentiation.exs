defmodule ModularExponentiation do
  def mod_pow(_base, 0, _modulus), do: 1

  def mod_pow(base, exponent, modulus) when rem(exponent, 2) == 0 do
    half = mod_pow(base, div(exponent, 2), modulus)
    rem(half * half, modulus)
  end

  def mod_pow(base, exponent, modulus) do
    rem(base * mod_pow(base, exponent - 1, modulus), modulus)
  end
end

IO.inspect(ModularExponentiation.mod_pow(2, 10, 1000))
IO.inspect(ModularExponentiation.mod_pow(7, 128, 13))
IO.inspect(ModularExponentiation.mod_pow(3, 200, 50))
