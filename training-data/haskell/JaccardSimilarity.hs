import Data.List (intersect, nub, union)

jaccard :: Eq a => [a] -> [a] -> Double
jaccard a b
  | null u = 1
  | otherwise = fromIntegral (length i) / fromIntegral (length u)
  where
    u = nub a `union` nub b
    i = nub a `intersect` nub b

main :: IO ()
main = print (jaccard [1, 2, 3, 4 :: Int] [3, 4, 5])
