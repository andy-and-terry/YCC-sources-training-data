bmi :: Double -> Double -> String
bmi w h
  | v < 18.5 = "under"
  | v < 25 = "normal"
  | otherwise = "over"
  where v = w / h ^ 2

main :: IO ()
main = mapM_ (putStrLn . uncurry bmi) [(50, 1.8), (70, 1.75), (95, 1.7)]
