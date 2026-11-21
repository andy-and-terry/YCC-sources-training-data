-- Disarium numbers: digits raised to their 1-based positions sum to n.
import Data.Char (digitToInt)

isDisarium :: Int -> Bool
isDisarium n = sum (zipWith (^) (map digitToInt (show n)) [1 :: Int ..]) == n

main :: IO ()
main = putStrLn (unwords (map show (filter isDisarium [1 .. 999])))
