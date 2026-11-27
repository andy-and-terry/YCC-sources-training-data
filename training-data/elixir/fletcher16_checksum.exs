defmodule Fletcher16 do
  import Bitwise

  def checksum(data) do
    {s1, s2} =
      for <<b <- data>>, reduce: {0, 0} do
        {a, c} ->
          a2 = rem(a + b, 255)
          {a2, rem(c + a2, 255)}
      end

    s2 <<< 8 ||| s1
  end
end

IO.puts(Integer.to_string(Fletcher16.checksum("abcde"), 16))
