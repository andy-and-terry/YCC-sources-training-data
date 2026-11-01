import qualified Data.Set as Set

-- Greedy sequence whose pairwise sums are all distinct.
step :: ([Int], Set.Set Int) -> Int -> ([Int], Set.Set Int)
step (seq', sums) cand
  | Set.size freshSet == length fresh && Set.null (Set.intersection freshSet sums) =
      (seq' ++ [cand], Set.union sums freshSet)
  | otherwise = (seq', sums)
  where
    fresh = map (+ cand) (seq' ++ [cand])
    freshSet = Set.fromList fresh

main :: IO ()
main = putStrLn . unwords . map show . take 8 . fst $ foldl step ([], Set.empty) [1 .. 60]
