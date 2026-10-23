import Data.List (group)

encode :: String -> [(Int, Char)]
encode = map (\g -> (length g, head g)) . group

decode :: [(Int, Char)] -> String
decode = concatMap (uncurry replicate)

render :: [(Int, Char)] -> String
render = concatMap (\(n, c) -> show n ++ [c])

main :: IO ()
main = do
  let s = "WWWWWWBBBWWCDDDDD"
      enc = encode s
  putStrLn (render enc)
  print (decode enc == s)
