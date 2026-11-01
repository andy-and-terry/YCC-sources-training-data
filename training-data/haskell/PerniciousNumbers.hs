import Data.Bits (popCount)

-- Pernicious numbers: the popcount is prime.
isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = putStrLn . unwords . map show $ filter (isPrime . popCount) [1 .. 20 :: Int]
