import Control.Applicative ((<|>))
import Data.Foldable (asum)
import qualified Data.Map as Map

lookupFirst :: [String] -> Map.Map String Int -> Maybe Int
lookupFirst keys m = asum (map (`Map.lookup` m) keys)

main :: IO ()
main = do
  let m = Map.fromList [("b", 2), ("c", 3)]
  print (Map.lookup "a" m <|> Map.lookup "b" m)
  print (Nothing <|> Nothing :: Maybe Int)
  print (lookupFirst ["a", "z", "c", "b"] m)
  print (lookupFirst ["x"] m)
  print ([1, 2] <|> [3 :: Int])
  print (asum [Nothing, Just 'x', Just 'y'])
