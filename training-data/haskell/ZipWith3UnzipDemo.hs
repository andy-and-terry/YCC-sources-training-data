import Data.List (unzip3, zip4, transpose, scanl')

main :: IO ()
main = do
  print (zip3 [1 :: Int, 2, 3] "abc" [True, False, True])
  print (zipWith3 (\a b c -> a + b * c) [1, 2, 3] [4, 5, 6] [7, 8, 9])
  let (as, bs, cs) = unzip3 [(1 :: Int, 'x', "p"), (2, 'y', "q")]
  print as >> print bs >> print cs
  print (unzip [(1 :: Int, 'a'), (2, 'b')])
  print (zip [1 :: Int ..] "hey")
  print (lookup 2 (zip [1 ..] "abc"))
  print (scanl' (+) 0 [1, 2, 3, 4])
