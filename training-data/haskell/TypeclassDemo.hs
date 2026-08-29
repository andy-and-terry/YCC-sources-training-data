class Shape a where
  area :: a -> Double
  perimeter :: a -> Double

data Circle = Circle Double
data Rectangle = Rectangle Double Double

instance Shape Circle where
  area (Circle r) = pi * r * r
  perimeter (Circle r) = 2 * pi * r

instance Shape Rectangle where
  area (Rectangle w h) = w * h
  perimeter (Rectangle w h) = 2 * (w + h)

main :: IO ()
main = do
  print (area (Circle 3))
  print (area (Rectangle 4 5))
