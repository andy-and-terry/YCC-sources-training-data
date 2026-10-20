import Data.Function (on, (&))
import Data.List (sortBy, groupBy)

main :: IO ()
main = do
  print (curry fst 1 2, uncurry (+) (3, 4), flip (-) 1 10, (subtract 3) 10)
  print ((map (* 2) . filter even) [1 .. 10], ((+ 1) . (* 2)) 5, (.) (+ 1) (* 2) 5)
  print ([1, 2, 3] & map (+ 1) & sum)
  print (groupBy ((==) `on` (`div` 10)) [1, 5, 11, 12, 25, 29])
  print (sortBy (compare `on` snd) [(1, 'c'), (2, 'a')], ($ 3) <$> [(+ 1), (* 2)])
  print (zipWith ($) (map (,) [1, 2]) "ab")
