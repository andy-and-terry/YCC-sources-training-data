class Shape a where
  area :: a -> Double

data Circle = Circle Double
data Rect = Rect Double Double

instance Shape Circle where area (Circle r) = pi * r * r
instance Shape Rect where area (Rect w h) = w * h

main :: IO ()
main = print (area (Circle 1), area (Rect 2 3))
