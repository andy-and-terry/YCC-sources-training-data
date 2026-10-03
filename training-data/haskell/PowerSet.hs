powerSet :: [Int] -> [[Int]]
powerSet [] = [[]]
powerSet (x : xs) = let rest = powerSet xs in rest ++ map (x :) rest

main :: IO ()
main = do
  let subsets = powerSet [1, 2, 3]
  mapM_ print subsets
  putStrLn ("total subsets: " ++ show (length subsets))
