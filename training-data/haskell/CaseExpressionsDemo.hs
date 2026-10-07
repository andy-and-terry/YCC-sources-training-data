data Shape = Circle Double | Rect Double Double | Triangle Double Double Double

describe :: Shape -> String
describe shape = case shape of
  Circle r
    | r <= 0 -> "degenerate circle"
    | otherwise -> "circle of area " ++ show (pi * r * r)
  Rect w h
    | w == h -> "square of side " ++ show w
    | otherwise -> "rectangle " ++ show w ++ "x" ++ show h
  Triangle a b c
    | a == b && b == c -> "equilateral"
    | a == b || b == c || a == c -> "isosceles"
    | otherwise -> "scalene"

firstTwo :: [a] -> Maybe (a, a)
firstTwo xs = case xs of
  (a : b : _) -> Just (a, b)
  _ -> Nothing

classify :: Int -> String
classify n = case (n `mod` 3, n `mod` 5) of
  (0, 0) -> "FizzBuzz"
  (0, _) -> "Fizz"
  (_, 0) -> "Buzz"
  _ -> show n

main :: IO ()
main = do
  mapM_ (putStrLn . describe) [Circle 1, Circle 0, Rect 2 2, Rect 2 3, Triangle 3 3 3, Triangle 3 3 4, Triangle 3 4 5]
  print (firstTwo [1, 2, 3 :: Int])
  print (firstTwo "a")
  putStrLn (unwords (map classify [1 .. 15]))
