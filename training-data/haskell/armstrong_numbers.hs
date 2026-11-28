import Data.Char (digitToInt)

isArmstrong :: Int -> Bool
isArmstrong n = sum [d ^ len | d <- ds] == n
  where
    ds = map digitToInt (show n)
    len = length ds

main :: IO ()
main = print (filter isArmstrong [1 .. 999]) -- [1,2,...,9,153,370,371,407]
