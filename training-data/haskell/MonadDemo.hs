safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide a b = Just (a `div` b)

compute :: Int -> Int -> Int -> Maybe Int
compute a b c = do
  x <- safeDivide a b
  y <- safeDivide x c
  return (y + 1)

main :: IO ()
main = do
  print (compute 100 5 2)
  print (compute 100 0 2)
