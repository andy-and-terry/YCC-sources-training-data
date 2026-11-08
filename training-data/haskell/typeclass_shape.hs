class Shape a where
  area :: a -> Double
  name :: a -> String

data Circle = Circle Double
data Rect = Rect Double Double

instance Shape Circle where
  area (Circle r) = pi * r * r
  name _ = "circle"

instance Shape Rect where
  area (Rect w h) = w * h
  name _ = "rect"

describe :: Shape a => a -> String
describe s = name s ++ ": " ++ show (area s)

main :: IO ()
main = putStrLn (describe (Circle 1)) >> putStrLn (describe (Rect 2 3))
