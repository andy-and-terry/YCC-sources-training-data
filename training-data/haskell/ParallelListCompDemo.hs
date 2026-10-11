{-# LANGUAGE ParallelListComp #-}

main :: IO ()
main = do
  print [(x, y) | x <- [1 :: Int ..] | y <- "abc"]
  print [x * y + z | x <- [1, 2, 3] | y <- [10, 20, 30] | z <- [100, 200, 300 :: Int]]
  print [(i, c) | i <- [0 :: Int ..] | c <- "hello", c /= 'l']
  print [(a, b) | a <- [1 :: Int, 2], b <- "xy"]
