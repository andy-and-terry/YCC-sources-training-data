import Data.List (group, sort)

encode :: String -> [(Char, Int)]
encode = map (\g -> (head g, length g)) . group

decode :: [(Char, Int)] -> String
decode = concatMap (\(c, n) -> replicate n c)

histogram :: String -> [(Char, Int)]
histogram = encode . sort

main :: IO ()
main = do
  let s = "aaabccddddd"
  print (encode s)
  print (decode (encode s) == s)
  print (histogram "mississippi")
