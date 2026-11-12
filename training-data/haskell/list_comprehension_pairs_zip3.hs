main :: IO ()
main = do
  print [(x, y) | x <- [1 .. 3], y <- "ab"]
  print (zip3 [1, 2, 3] "abc" [True, False, True])
  print [x * x | x <- [1 .. 10], odd x]
