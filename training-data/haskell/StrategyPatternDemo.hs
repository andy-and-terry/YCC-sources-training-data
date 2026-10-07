import Data.List (sort)

-- Strategy pattern in Haskell is just passing a function around: no
-- interface/class hierarchy is needed, functions are already first class.
type SortStrategy = [Int] -> [Int]

ascending :: SortStrategy
ascending = sort

descending :: SortStrategy
descending = reverse . sort

sortWith :: SortStrategy -> [Int] -> [Int]
sortWith strategy xs = strategy xs

main :: IO ()
main = do
  let xs = [5, 2, 8, 1, 9]
  print (sortWith ascending xs)
  print (sortWith descending xs)
