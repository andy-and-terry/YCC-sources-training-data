import Data.Maybe (fromMaybe, mapMaybe)
import Text.Read (readMaybe)

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just (a `div` b)

calc :: String -> String -> Maybe Int
calc a b = do
  x <- readMaybe a
  y <- readMaybe b
  q <- safeDiv x y
  return (q + 1)

main :: IO ()
main = do
  print (calc "10" "2", calc "10" "0", calc "x" "1")
  print (mapMaybe readMaybe ["1", "a", "3"] :: [Int])
  print (fromMaybe 0 (lookup "k" [("k", 5)]))
  print (sequence [Just 1, Just 2], sequence [Just 1, Nothing])
  print (traverse (`safeDiv` 2) [4, 6])
