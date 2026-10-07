permute :: [Int] -> [[Int]]
permute [] = [[]]
permute xs =
  [ x : rest
  | (x, remaining) <- picks xs
  , rest <- permute remaining
  ]
  where
    picks [] = []
    picks (y : ys) = (y, ys) : [(z, y : zs) | (z, zs) <- picks ys]

main :: IO ()
main = do
  let perms = permute [1, 2, 3]
  mapM_ print perms
  putStrLn ("total permutations: " ++ show (length perms))
