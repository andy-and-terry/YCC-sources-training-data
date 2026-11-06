-- Highest value reached by the Collatz (hailstone) sequence from n.
step :: Integer -> Integer
step n = if even n then n `div` 2 else 3 * n + 1

peak :: Integer -> Integer
peak = maximum . takeWhile (/= 1) . iterate step

main :: IO ()
main = print (peak 27)
