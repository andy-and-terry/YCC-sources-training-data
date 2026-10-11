import Data.Function (on, (&))
import Data.List (sortBy, groupBy)

addPair :: (Int, Int) -> Int
addPair = uncurry (+)

main :: IO ()
main = do
  print (map addPair [(1, 2), (3, 4)])
  print (curry fst 'a' 'b')
  print (flip (-) 1 10)
  print (zipWith (flip (:)) [[1], [2]] [9, 8])
  print (groupBy ((==) `on` (`div` 10)) [1, 5, 11, 12, 25, 29])
  print ([1 .. 10] & filter even & map (^ 2) & sum)
  let compose3 = (.) . (.)
  print ((negate `compose3` (+)) 2 3)
  print (until (> 100) (* 2) 1)
