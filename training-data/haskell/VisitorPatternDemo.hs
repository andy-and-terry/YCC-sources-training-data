-- The visitor pattern exists to add new operations without touching the
-- data types; in Haskell that's just writing a new function over the ADT.
data Shape
  = Circle Double
  | Square Double
  deriving Show

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Square s) = s * s

describe :: Shape -> String
describe s@(Circle _) = show s ++ " has area " ++ show (area s)
describe s@(Square _) = show s ++ " has area " ++ show (area s)

main :: IO ()
main = do
  let shapes = [Circle 2.0, Square 3.0]
  mapM_ (putStrLn . describe) shapes
