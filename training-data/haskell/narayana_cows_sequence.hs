-- Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
narayana :: [Integer]
narayana = 1 : 1 : 1 : zipWith (+) (drop 2 narayana) narayana

main :: IO ()
main = putStrLn (unwords (map show (take 15 narayana)))
