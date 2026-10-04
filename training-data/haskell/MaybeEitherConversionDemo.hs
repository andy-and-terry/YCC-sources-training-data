import Data.Maybe (fromMaybe, mapMaybe, catMaybes, listToMaybe)
import Data.Either (lefts, rights, partitionEithers, either)
import Text.Read (readMaybe)

parseAge :: String -> Either String Int
parseAge s = case readMaybe s of
  Nothing -> Left ("not a number: " ++ s)
  Just n | n < 0 -> Left "negative"
         | otherwise -> Right n

main :: IO ()
main = do
  let inputs = ["12", "abc", "-4", "30"]
  let results = map parseAge inputs
  print results
  print (partitionEithers results)
  print (mapMaybe (\s -> readMaybe s :: Maybe Int) inputs)
  print (fromMaybe 0 (listToMaybe []), catMaybes [Just 1, Nothing, Just (3 :: Int)])
  putStrLn (either ("error: " ++) (("ok " ++) . show) (parseAge "9"))
  print (sequence [Just 1, Just 2, Just (3 :: Int)], traverse parseAge ["1", "x"])
