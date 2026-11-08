bmiTell :: Double -> Double -> String
bmiTell w h
  | bmi <= under = "underweight"
  | bmi <= normal = "normal"
  | otherwise = "overweight"
  where
    bmi = w / h ^ 2
    (under, normal) = (18.5, 25.0)

main :: IO ()
main = mapM_ (putStrLn . uncurry bmiTell) [(50, 1.8), (70, 1.75), (100, 1.7)]
