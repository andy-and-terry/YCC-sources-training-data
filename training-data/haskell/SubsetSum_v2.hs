import qualified Data.Set as Set

canSum :: [Int] -> Int -> Bool
canSum nums target = target `Set.member` reachable
  where
    reachable = foldl step (Set.singleton 0) nums
    step acc num = Set.union acc (Set.map (+ num) (Set.filter (\s -> s + num <= target) acc))

main :: IO ()
main = do
  let nums = [3, 34, 4, 12, 5, 2]
  print (canSum nums 9)
  print (canSum nums 10)
  print (canSum nums 21)
