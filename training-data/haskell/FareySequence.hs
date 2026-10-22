farey :: Int -> [String]
farey n = "0/1" : go 0 1 1 n
  where
    go a b c d
      | c > n = []
      | otherwise =
          let k = (n + b) `div` d
          in (show c ++ "/" ++ show d) : go c d (k * c - a) (k * d - b)

main :: IO ()
main = putStrLn (unwords (farey 5))
