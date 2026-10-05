import Control.Applicative ((<|>))
import Text.Read (readMaybe)

data User = User { name :: String, age :: Int } deriving Show

mkUser :: String -> String -> Maybe User
mkUser n a = User <$> nonEmpty n <*> readMaybe a
  where
    nonEmpty s = if null s then Nothing else Just s

main :: IO ()
main = do
  print (mkUser "Ada" "36")
  print (mkUser "" "36")
  print (mkUser "Bob" "x")
  print ((+) <$> Just 3 <*> Just 4)
  print (pure 5 :: Maybe Int)
  print (sequenceA [Just 1, Just 2, Just 3])
  print (traverse readMaybe ["1", "2", "x"] :: Maybe [Int])
  print (Nothing <|> Just (1 :: Int))
