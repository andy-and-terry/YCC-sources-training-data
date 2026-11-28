import Data.Char (digitToInt)

isHappy :: Int -> Bool
isHappy = go []
  where
    go seen 1 = True
    go seen n
      | n `elem` seen = False
      | otherwise = go (n : seen) (sum [digitToInt c ^ 2 | c <- show n])

main :: IO ()
main = print (take 8 (filter isHappy [1 ..])) -- [1,7,10,13,19,23,28,31]
