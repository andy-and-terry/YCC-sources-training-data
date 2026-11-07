import Data.List (findIndex)

equilibriumIndex :: [Int] -> Maybe Int
equilibriumIndex xs = findIndex id (zipWith3 check lefts xs rights)
  where
    lefts = scanl (+) 0 xs
    rights = tail (scanr (+) 0 xs)
    check l _ r = l == r

main :: IO ()
main = do
  print (equilibriumIndex [1, 7, 3, 6, 5, 6]) -- Just 3
  print (equilibriumIndex [1, 2, 3])          -- Nothing
