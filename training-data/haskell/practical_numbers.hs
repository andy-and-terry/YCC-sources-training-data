-- Practical numbers: every m in 1..n is a sum of distinct divisors of n.
import Data.Bits (shiftL, (.&.), (.|.))

isPractical :: Int -> Bool
isPractical n = reach .&. mask == mask
  where
    -- bit i set <=> i is a subset sum of the divisors
    reach = foldl (\acc d -> acc .|. (acc `shiftL` d)) (1 :: Integer) [d | d <- [1 .. n], n `mod` d == 0]
    mask = (1 `shiftL` (n + 1)) - 1

main :: IO ()
main = putStrLn . unwords . map show $ filter isPractical [1 .. 40]
