-- Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
perrin :: [Integer]
perrin = 3 : 0 : 2 : zipWith (+) perrin (tail perrin)

main :: IO ()
main = putStrLn (unwords (map show (take 15 perrin)))
