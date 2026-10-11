{-# LANGUAGE ExistentialQuantification #-}

class Shape a where
  area :: a -> Double
  perimeter :: a -> Double
  describe :: a -> String
  describe s = "area=" ++ show (area s) ++ " perimeter=" ++ show (perimeter s)

data Circle = Circle Double
data Rect = Rect Double Double

instance Shape Circle where
  area (Circle r) = pi * r * r
  perimeter (Circle r) = 2 * pi * r

instance Shape Rect where
  area (Rect w h) = w * h
  perimeter (Rect w h) = 2 * (w + h)
  describe r = "rect: " ++ show (area r)

data AnyShape = forall s. Shape s => AnyShape s

main :: IO ()
main = do
  putStrLn (describe (Circle 1))
  putStrLn (describe (Rect 2 3))
