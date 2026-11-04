merge :: Ord a => [a] -> [a] -> [a]
merge xs@(x : xt) ys@(y : yt)
  | x < y = x : merge xt ys
  | x > y = y : merge xs yt
  | otherwise = x : merge xt yt
merge xs [] = xs
merge [] ys = ys

ugly :: [Integer]
ugly = 1 : merge (map (* 2) ugly) (merge (map (* 3) ugly) (map (* 5) ugly))

main :: IO ()
main = print (take 12 ugly)
