import qualified Data.Set as Set

type Cell = (Int, Int)

step :: Set.Set Cell -> Set.Set Cell
step live = Set.filter rule candidates
  where
    neighbors (x, y) = [(x + dx, y + dy) | dx <- [-1, 0, 1], dy <- [-1, 0, 1], (dx, dy) /= (0, 0)]
    candidates = Set.union live (Set.fromList (concatMap neighbors (Set.toList live)))
    count c = length (filter (`Set.member` live) (neighbors c))
    rule c
      | c `Set.member` live = count c `elem` [2, 3]
      | otherwise = count c == 3

render :: Set.Set Cell -> String
render live = unlines [[if (x, y) `Set.member` live then '#' else '.' | x <- [0 .. 4]] | y <- [0 .. 4]]

main :: IO ()
main = mapM_ (putStrLn . render) (take 3 (iterate step (Set.fromList [(1, 2), (2, 2), (3, 2)])))
