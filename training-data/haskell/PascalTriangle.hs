nextRow :: [Integer] -> [Integer]
nextRow row = zipWith (+) (0 : row) (row ++ [0])

pascal :: Int -> [[Integer]]
pascal n = take n (iterate nextRow [1])

main :: IO ()
main = mapM_ (putStrLn . unwords . map show) (pascal 6)
