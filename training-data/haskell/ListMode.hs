import qualified Data.Map.Strict as M

modes :: Ord a => [a] -> [a]
modes xs = [k | (k, c) <- M.toList counts, c == top]
  where
    counts = M.fromListWith (+) [(x, 1 :: Int) | x <- xs]
    top = maximum (M.elems counts)

main :: IO ()
main = print (modes [1, 2, 2, 3, 3, 4 :: Int])
