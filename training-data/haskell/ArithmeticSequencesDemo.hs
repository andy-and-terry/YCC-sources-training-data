main :: IO ()
main = do
  print [1 .. 10 :: Int]
  print [1, 3 .. 15 :: Int]
  print [10, 8 .. 0 :: Int]
  print [5 .. 1 :: Int]
  print ['a' .. 'j']
  print ['a', 'c' .. 'k']
  print [1.0, 1.5 .. 3.0 :: Double]
  print (take 5 [0, 5 ..] :: [Int])
  print (divMod 17 5 :: (Int, Int), divMod (-17) 5 :: (Int, Int))
  print (quotRem 17 5 :: (Int, Int), quotRem (-17) 5 :: (Int, Int))
  print (gcd 48 18 :: Int, lcm 4 6 :: Int)
  print (2 ^ (64 :: Int) :: Integer)
  print (fromIntegral (maxBound :: Int) + 1 :: Integer)
  print (truncate (-2.7 :: Double) :: Int, round (2.5 :: Double) :: Int, round (3.5 :: Double) :: Int)
  print (ceiling (2.1 :: Double) :: Int, floor (-2.1 :: Double) :: Int)
  print (sum [1 .. 100 :: Int], product [1 .. 10 :: Int])
