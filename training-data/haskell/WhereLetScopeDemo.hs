bmiCategory :: Double -> Double -> String
bmiCategory weight height
  | bmi < underweight = "underweight"
  | bmi < normal = "normal"
  | otherwise = "overweight"
  where
    bmi = weight / height ^ (2 :: Int)
    (underweight, normal) = (18.5, 25.0)

cylinderArea :: Double -> Double -> Double
cylinderArea r h =
  let side = 2 * pi * r * h
      top = pi * r ^ (2 :: Int)
   in side + 2 * top

roots :: Double -> Double -> Double -> Maybe (Double, Double)
roots a b c
  | disc < 0 = Nothing
  | otherwise = Just ((-b + sq) / (2 * a), (-b - sq) / (2 * a))
  where
    disc = b * b - 4 * a * c
    sq = sqrt disc

main :: IO ()
main = do
  putStrLn (bmiCategory 70 1.75)
  putStrLn (bmiCategory 50 1.80)
  print (cylinderArea 1 2)
  print (roots 1 (-3) 2)
  print (roots 1 0 1)
  let squares = [x * x | x <- [1 .. 5 :: Int]]
      total = sum squares
  print (squares, total)
  print (let y = 3; z = 4 in y * z :: Int)
