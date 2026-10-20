class HasArea a where
  area :: a -> Double

data Circle = Circle Double
data Rect = Rect Double Double

instance HasArea Circle where area (Circle r) = pi * r * r
instance HasArea Rect where area (Rect w h) = w * h

main :: IO ()
main = print (area (Circle 1), area (Rect 2 3))
