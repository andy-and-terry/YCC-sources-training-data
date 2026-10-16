import Data.Ord (comparing, Down(..), clamp)
import Data.List (sortOn, sortBy, minimumBy, maximumBy)

main :: IO ()
main = do
  print (clamp (0, 10) 15, clamp (0, 10) (-5), clamp (0, 10) 7)
  print (sortOn Down [3, 1, 2])
  print (sortOn snd [(1, 'c'), (2, 'a'), (3, 'b')])
  print (maximumBy (comparing length) ["a", "abc", "ab"])
  print (minimumBy (comparing abs) [-3, 2, -1, 4])
  print (compare 1 2, compare "b" "a", compare 'x' 'x')
  print (max "apple" "apricot", min (1, 'b') (1, 'a'))
