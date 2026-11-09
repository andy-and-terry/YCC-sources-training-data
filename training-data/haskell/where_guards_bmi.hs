bmiTell :: Double -> Double -> String
bmiTell w h
  | bmi <= 18.5 = "under"
  | bmi <= 25.0 = "normal"
  | otherwise = "over"
  where bmi = w / h ^ 2

main :: IO ()
main = putStrLn (bmiTell 70 1.75)
