woodall :: Int -> Int
woodall n = n * 2 ^ n - 1

main :: IO ()
main = putStrLn (unwords (map (show . woodall) [1 .. 10]))
