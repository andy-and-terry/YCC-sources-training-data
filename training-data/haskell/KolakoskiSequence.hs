kolakoski :: Int -> [Int]
kolakoski count = go [1, 2, 2] 2
  where
    go seq i
      | length seq >= count = take count seq
      | otherwise = go (seq ++ replicate (seq !! i) (3 - last seq)) (i + 1)

main :: IO ()
main = putStrLn (unwords (map show (kolakoski 20)))
