import Data.List (transpose)

saddlePoints :: [[Int]] -> [(Int, Int)]
saddlePoints m =
  [ (r, c)
  | (r, row) <- zip [0 ..] m
  , (c, v) <- zip [0 ..] row
  , v == maximum row
  , v == colMins !! c
  ]
  where
    colMins = map minimum (transpose m)

main :: IO ()
main = print (saddlePoints [[9, 8, 7], [5, 3, 2], [6, 6, 7]])
