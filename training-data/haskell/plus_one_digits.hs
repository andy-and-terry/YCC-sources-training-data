plusOne :: [Int] -> [Int]
plusOne ds = case foldr step (1, []) ds of
  (0, r) -> r
  (c, r) -> c : r
  where
    step d (c, acc) = let s = d + c in (s `div` 10, s `mod` 10 : acc)

main :: IO ()
main = do
  print (plusOne [1, 2, 9]) -- [1,3,0]
  print (plusOne [9, 9])    -- [1,0,0]
