import qualified Data.Set as Set

hasSubsetSum :: [Int] -> Int -> Bool
hasSubsetSum nums target = Set.member target (foldl step (Set.singleton 0) nums)
  where
    step sums x = Set.union sums (Set.map (+ x) (Set.filter (\s -> s + x <= target) sums))

main :: IO ()
main = do
  print (hasSubsetSum [3, 34, 4, 12, 5, 2] 9)
  print (hasSubsetSum [3, 34, 4, 12, 5, 2] 10)
