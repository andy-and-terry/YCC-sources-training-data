pascal :: [[Integer]]
pascal = iterate next [1]
  where
    next row = zipWith (+) (0 : row) (row ++ [0])

main :: IO ()
main = mapM_ (putStrLn . unwords . map show) (take 8 pascal)
