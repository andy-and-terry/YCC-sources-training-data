import Data.List (group)

encode :: String -> [(Char, Int)]
encode s = map (\g -> (head g, length g)) (group s)

decode :: [(Char, Int)] -> String
decode = concatMap (\(c, n) -> replicate n c)

main :: IO ()
main = do
  let original = "aaabbbccccd"
      encoded = encode original
  print encoded
  putStrLn (decode encoded)
  print (decode encoded == original)
