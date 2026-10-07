data Color = Red | Green | Blue deriving (Show, Read, Eq, Ord, Enum, Bounded)

data Point = Point { px :: Int, py :: Int } deriving (Show, Read, Eq)

newtype Celsius = Celsius Double

instance Show Celsius where
  showsPrec d (Celsius t) = showParen (d > 10) (showString "Celsius " . showsPrec 11 t)

main :: IO ()
main = do
  print (read "Blue" :: Color)
  print (read "Point {px = 1, py = 2}" :: Point)
  print (read "[1,2,3]" :: [Int])
  print (read "(1,\"hi\")" :: (Int, String))
  print [minBound .. maxBound :: Color]
  print (Just (Celsius (-3.5)))
  print (reads "42 rest" :: [(Int, String)])
  putStrLn (show (Point 3 4))
