import Data.Either (lefts, rights, partitionEithers)
import Text.Read (readMaybe)

parseAge :: String -> Either String Int
parseAge s = case readMaybe s of
  Nothing -> Left ("not a number: " ++ s)
  Just n
    | n < 0 -> Left "negative age"
    | otherwise -> Right n

main :: IO ()
main = do
  print (traverse parseAge ["10", "20", "30"])
  print (traverse parseAge ["10", "x", "-5"])
  let rs = map parseAge ["1", "oops", "3", "-1"]
  print (lefts rs)
  print (rights rs)
  print (partitionEithers rs)
  print (either length (* 2) (parseAge "abc"))
  print (sequence [Just 1, Just 2], sequence [Just 1, Nothing])
