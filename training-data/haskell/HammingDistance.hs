hamming :: String -> String -> Maybe Int
hamming a b
  | length a /= length b = Nothing
  | otherwise = Just . length . filter id $ zipWith (/=) a b

main :: IO ()
main = do
  print (hamming "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT")
  print (hamming "AB" "A")
