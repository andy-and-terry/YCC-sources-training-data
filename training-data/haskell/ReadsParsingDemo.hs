import Data.Char (isDigit, isSpace)
import Data.Maybe (mapMaybe)
import Text.Read (readEither, readMaybe)

data Color = Red | Green | Blue deriving (Show, Read, Eq, Enum, Bounded)

data Point = Point {px :: Int, py :: Int} deriving (Show, Read)

parseInts :: String -> [Int]
parseInts = mapMaybe readMaybe . words

main :: IO ()
main = do
  print (readMaybe "42" :: Maybe Int)
  print (readMaybe "4x2" :: Maybe Int)
  print (readMaybe "3.5" :: Maybe Double)
  print (readMaybe "[1,2,3]" :: Maybe [Int])
  print (readMaybe "(1,\"hi\")" :: Maybe (Int, String))
  print (readMaybe "Blue" :: Maybe Color)
  print (readMaybe "Purple" :: Maybe Color)
  print (read "Point {px = 3, py = -4}" :: Point)
  print (readEither "abc" :: Either String Int)
  print (parseInts "10 x 20 3.5 30")
  print (reads "17 apples" :: [(Int, String)])
  print [minBound .. maxBound :: Color]
  print (dropWhile isSpace "   trimmed" , takeWhile isDigit "123abc")
