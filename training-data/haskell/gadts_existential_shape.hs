{-# LANGUAGE ExistentialQuantification #-}

class Shape a where
  area :: a -> Double
  label :: a -> String

data Circle = Circle Double
data Square = Square Double
instance Shape Circle where { area (Circle r) = pi * r * r; label _ = "circle" }
instance Shape Square where { area (Square s) = s * s; label _ = "square" }

data AnyShape = forall s. Shape s => AnyShape s

main :: IO ()
main = mapM_ (\(AnyShape s) -> putStrLn (label s ++ " " ++ show (area s))) [AnyShape (Circle 1), AnyShape (Square 2)]
