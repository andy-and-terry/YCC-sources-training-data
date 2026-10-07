import Data.List (nub, sort)

data Kind = Equilateral | Isosceles | Scalene deriving (Show)

classify :: Double -> Double -> Double -> Maybe Kind
classify a b c
  | x <= 0 || x + y <= z = Nothing
  | otherwise = Just $ case length (nub [a, b, c]) of
      1 -> Equilateral
      2 -> Isosceles
      _ -> Scalene
  where
    [x, y, z] = sort [a, b, c]

main :: IO ()
main = mapM_ (\(a, b, c) -> print (classify a b c)) [(3, 3, 3), (3, 4, 4), (3, 4, 5), (1, 1, 3)]
