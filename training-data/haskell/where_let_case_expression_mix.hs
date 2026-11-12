classify :: Int -> String
classify n = case compare n 0 of
  LT -> "neg"
  EQ -> "zero"
  GT -> let h = n `div` 2 in if h > 10 then "big" else "pos"

main :: IO ()
main = mapM_ (putStrLn . classify) [-1, 0, 5, 50]
