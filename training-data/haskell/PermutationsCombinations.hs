import Data.List (permutations)

combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations k (x : xs) = map (x :) (combinations (k - 1) xs) ++ combinations k xs

perms :: [a] -> [[a]]
perms [] = [[]]
perms xs = [y : p | (y, rest) <- picks xs, p <- perms rest]
  where
    picks [] = []
    picks (z : zs) = (z, zs) : [(w, z : ws) | (w, ws) <- picks zs]

main :: IO ()
main = do
  print (perms [1, 2, 3 :: Int])
  print (length (permutations [1 .. 5 :: Int]))
  print (combinations 2 "abcd")
