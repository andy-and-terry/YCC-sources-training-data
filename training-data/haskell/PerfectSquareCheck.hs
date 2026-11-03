isPerfectSquare :: Int -> Bool
isPerfectSquare n
  | n < 0 = False
  | otherwise = let r = round (sqrt (fromIntegral n :: Double)) in r * r == n

main :: IO ()
main = print (filter isPerfectSquare [0 .. 29])
