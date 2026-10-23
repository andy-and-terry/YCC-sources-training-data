-- Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
padovan :: [Integer]
padovan = 1 : 1 : 1 : zipWith (+) padovan (tail padovan)

main :: IO ()
main = putStrLn (unwords (map show (take 15 padovan)))
