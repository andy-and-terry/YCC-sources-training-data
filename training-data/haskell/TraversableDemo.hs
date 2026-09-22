safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide a b = Just (a `div` b)

main :: IO ()
main = do
  print (traverse (safeDivide 100) [2, 5, 10])
  print (traverse (safeDivide 100) [2, 0, 10])

  print (sequence [Just 1, Just 2, Just 3])
  print (sequence [Just 1, Nothing, Just 3])

  results <- mapM (\x -> return (x * x)) [1, 2, 3, 4]
  print results
