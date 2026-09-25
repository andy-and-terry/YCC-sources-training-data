import Data.Char (digitToInt, isDigit, isSpace)

luhnValid :: String -> Bool
luhnValid input =
  length s > 1 && all isDigit s && total `mod` 10 == 0
  where
    s = filter (not . isSpace) input
    total = sum $ zipWith step [0 :: Int ..] (reverse (map digitToInt s))
    step i d
      | odd i = let x = d * 2 in if x > 9 then x - 9 else x
      | otherwise = d

main :: IO ()
main = print (luhnValid "4539 3195 0343 6467", luhnValid "8273 1232 7352 0569")
