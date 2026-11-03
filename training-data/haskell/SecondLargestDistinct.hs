import Data.List (nub, sortBy)
import Data.Ord (comparing, Down (..))

secondLargest :: [Int] -> Maybe Int
secondLargest xs = case sortBy (comparing Down) (nub xs) of
  (_ : y : _) -> Just y
  _ -> Nothing

main :: IO ()
main = do
  print (secondLargest [5, 3, 9, 9, 1])
  print (secondLargest [2, 2])
