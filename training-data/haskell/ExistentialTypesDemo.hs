{-# LANGUAGE ExistentialQuantification #-}

class Shape a where
  area :: a -> Double
  name :: a -> String

data Circle = Circle Double

data Rect = Rect Double Double

data Triangle = Triangle Double Double

instance Shape Circle where
  area (Circle r) = pi * r * r
  name _ = "circle"

instance Shape Rect where
  area (Rect w h) = w * h
  name _ = "rectangle"

instance Shape Triangle where
  area (Triangle b h) = 0.5 * b * h
  name _ = "triangle"

-- Hide the concrete type behind the class constraint
data AnyShape = forall s. Shape s => AnyShape s

describe :: AnyShape -> String
describe (AnyShape s) = name s ++ " with area " ++ show (fromIntegral (round (area s * 100)) / 100)

main :: IO ()
main = do
  let shapes = [AnyShape (Circle 1.5), AnyShape (Rect 2 3), AnyShape (Triangle 4 5)]
  mapM_ (putStrLn . describe) shapes
  let total = sum [area s | AnyShape s <- shapes]
  putStrLn ("total area: " ++ show (fromIntegral (round (total * 100)) / 100))
