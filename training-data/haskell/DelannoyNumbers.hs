delannoyRows :: Int -> [[Integer]]
delannoyRows size = take size (iterate nextRow (replicate size 1))
  where
    nextRow prev = scanl (\cur (p0, p1) -> p1 + cur + p0) 1 (zip prev (tail prev))

main :: IO ()
main = putStrLn (unwords [show (row !! i) | (i, row) <- zip [0 ..] (delannoyRows 10)])
