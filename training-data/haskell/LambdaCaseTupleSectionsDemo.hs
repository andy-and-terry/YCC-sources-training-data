{-# LANGUAGE LambdaCase, TupleSections #-}

classify :: Int -> String
classify = \case
  0 -> "zero"
  n | n < 0 -> "negative"
    | even n -> "even"
    | otherwise -> "odd"

main :: IO ()
main = do
  mapM_ (putStrLn . classify) [0, -3, 4, 7]
  print (map (,True) [1, 2, 3 :: Int])
  print (map ("id",) "ab")
  print (zipWith (,,) [1 :: Int, 2] "xy" <*> [True])
