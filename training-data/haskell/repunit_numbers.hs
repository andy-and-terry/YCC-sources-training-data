-- Repunits: numbers made only of the digit 1.
repunits :: [Integer]
repunits = iterate (\r -> r * 10 + 1) 1

main :: IO ()
main = print (take 5 repunits)
