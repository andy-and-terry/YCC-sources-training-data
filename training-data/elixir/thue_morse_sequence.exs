import Bitwise

# Thue-Morse: t(n) is the parity of the number of 1 bits in n
parity = fn parity, 0, acc -> acc
              parity, n, acc -> parity.(parity, n >>> 1, bxor(acc, n &&& 1)) end

0..31
|> Enum.map(&parity.(parity, &1, 0))
|> Enum.join()
|> IO.puts()
