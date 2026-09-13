import qualified Data.Map as Map

wordCounts :: [String] -> Map.Map String Int
wordCounts ws = foldr (\w m -> Map.insertWith (+) w 1 m) Map.empty ws

main :: IO ()
main = do
  let counts = wordCounts (words "the quick brown fox jumps over the lazy dog the fox runs")
  print (Map.toList counts)
  print (Map.lookup "fox" counts)
  print (Map.lookup "cat" counts)
  let updated = Map.adjust (+ 10) "the" counts
  print (Map.lookup "the" updated)
  print (Map.size counts)
  print (Map.keys counts)
