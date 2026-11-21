-- Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
phi :: Int -> Int
phi n = length [k | k <- [1 .. n], gcd k n == 1]

chainSum :: Int -> Int
chainSum m
  | m <= 1 = 0
  | otherwise = phi m + chainSum (phi m)

isPerfectTotient :: Int -> Bool
isPerfectTotient n = chainSum n == n

main :: IO ()
main = putStrLn (unwords (map show (filter isPerfectTotient [2 .. 199])))
