import Data.List (sortBy, maximumBy)
import Data.Ord (comparing)

class Shape a where
  area :: a -> Double
  perimeter :: a -> Double
  describe :: a -> String
  describe x = "shape with area " ++ show (area x)

data Circle = Circle Double
data Rect = Rect Double Double

instance Shape Circle where
  area (Circle r) = pi * r * r
  perimeter (Circle r) = 2 * pi * r

instance Shape Rect where
  area (Rect w h) = w * h
  perimeter (Rect w h) = 2 * (w + h)
  describe r = "rectangle " ++ show (area r)

largest :: (Ord b) => (a -> b) -> [a] -> a
largest f = maximumBy (comparing f)

main :: IO ()
main = do
  putStrLn (describe (Circle 1))
  putStrLn (describe (Rect 2 3))
  print (largest negate [3, 1, 2 :: Int])
  print (sortBy (comparing snd) [(1 :: Int, 'c'), (2, 'a'), (3, 'b')])
