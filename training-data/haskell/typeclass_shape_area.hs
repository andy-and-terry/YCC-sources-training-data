class Shape a where
  area :: a -> Double

data Circle = Circle Double
data Rect = Rect Double Double

instance Shape Circle where area (Circle r) = pi * r * r
instance Shape Rect where area (Rect w h) = w * h

main :: IO ()
main = print (area (Rect 3 4), area (Circle 1))
