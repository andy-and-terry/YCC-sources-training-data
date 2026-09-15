import qualified Data.Set as Set

achievableSums :: [Int] -> Int -> Set.Set Int
achievableSums nums target = foldl step (Set.singleton 0) nums
  where
    step acc n = Set.union acc (Set.map (+ n) (Set.filter (\s -> s + n <= target) acc))

subsetSum :: [Int] -> Int -> Bool
subsetSum nums target = target `Set.member` achievableSums nums target

main :: IO ()
main = do
  print (subsetSum [3, 34, 4, 12, 5, 2] 9)
  print (subsetSum [3, 34, 4, 12, 5, 2] 30)
