import qualified Data.Map as Map
import Data.List (words)

wordFrequency :: String -> Map.Map String Int
wordFrequency = foldr (\w m -> Map.insertWith (+) w 1 m) Map.empty . words

main :: IO ()
main = print (Map.toList (wordFrequency "the quick brown fox the lazy dog the fox"))
