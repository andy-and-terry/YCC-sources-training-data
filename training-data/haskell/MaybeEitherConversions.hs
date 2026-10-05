import Data.Either (lefts, rights, partitionEithers, either)
import Data.Maybe (catMaybes, fromMaybe, listToMaybe, mapMaybe, maybe)
import Text.Read (readMaybe)

parseInt :: String -> Either String Int
parseInt s = maybe (Left ("bad number: " ++ s)) Right (readMaybe s)

main :: IO ()
main = do
  let inputs = ["1", "x", "3", "y"]
      results = map parseInt inputs
  print results
  print (lefts results)
  print (rights results)
  print (partitionEithers results)
  print (mapMaybe (\s -> readMaybe s :: Maybe Int) inputs)
  print (catMaybes [Just 1, Nothing, Just (3 :: Int)])
  print (fromMaybe 0 (listToMaybe ([] :: [Int])))
  print (either length (* 2) (Left "abc" :: Either String Int))
  print (maybe "none" show (Just (42 :: Int)))
