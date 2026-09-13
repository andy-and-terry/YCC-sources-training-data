newtype Meters = Meters Double deriving (Eq, Ord)

newtype Feet = Feet Double deriving (Eq, Ord)

class Length a where
  toMeters :: a -> Double

instance Length Meters where
  toMeters (Meters m) = m

instance Length Feet where
  toMeters (Feet f) = f * 0.3048

instance Show Meters where
  show (Meters m) = show m ++ "m"

instance Show Feet where
  show (Feet f) = show f ++ "ft"

addLengths :: (Length a, Length b) => a -> b -> Meters
addLengths a b = Meters (toMeters a + toMeters b)

main :: IO ()
main = do
  let m = Meters 5.0
  let f = Feet 10.0
  print m
  print f
  print (addLengths m f)
  print (toMeters f)
