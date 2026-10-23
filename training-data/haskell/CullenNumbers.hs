cullen :: Int -> Int
cullen n = n * 2 ^ n + 1

main :: IO ()
main = putStrLn (unwords (map (show . cullen) [0 .. 9]))
