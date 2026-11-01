class HasArea a where
  area :: a -> Double
  describe :: a -> String
  describe x = "area=" ++ show (area x)

data Circle = Circle Double
data Rect = Rect Double Double

instance HasArea Circle where area (Circle r) = pi * r * r
instance HasArea Rect where
  area (Rect w h) = w * h
  describe r = "rect " ++ show (area r)

main :: IO ()
main = putStrLn (describe (Circle 1)) >> putStrLn (describe (Rect 2 3))
