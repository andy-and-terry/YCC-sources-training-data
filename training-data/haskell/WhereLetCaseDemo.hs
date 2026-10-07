classify :: Int -> String
classify n = case compare n 0 of
  LT -> "negative"
  EQ -> "zero"
  GT | even n -> "positive even"
     | otherwise -> "positive odd"

bmi :: Double -> Double -> String
bmi w h
  | v < under = "under"
  | v < normal = "normal"
  | otherwise = "over"
  where
    v = w / h ^ (2 :: Int)
    (under, normal) = (18.5, 25.0)

main :: IO ()
main = do
  mapM_ (putStrLn . classify) [-3, 0, 4, 7]
  putStrLn (bmi 70 1.75)
  let sq x = x * x
      total = sum (map sq [1 .. 5 :: Int])
  print total
  print (let (a, b) = (3, 4 :: Int) in a * b)
