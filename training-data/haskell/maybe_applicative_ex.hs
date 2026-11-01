import Text.Read (readMaybe)

add :: String -> String -> Maybe Int
add a b = (+) <$> readMaybe a <*> readMaybe b

main :: IO ()
main = do
  print (add "3" "4")
  print (add "3" "x")
