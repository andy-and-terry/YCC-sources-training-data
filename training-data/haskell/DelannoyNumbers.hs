-- D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1), built row by row.
delannoyRows :: [[Integer]]
delannoyRows = iterate nextRow (repeat 1)
  where nextRow prev = let row = 1 : zipWith3 (\a b c -> a + b + c) (tail prev) row prev in row

central :: Int -> Integer
central n = delannoyRows !! n !! n

main :: IO ()
main = putStrLn (unwords (map (show . central) [0 .. 5])) -- 1 3 13 63 321 1683
