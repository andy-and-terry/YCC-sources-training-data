pieces :: Int -> Int
pieces cuts = (cuts * cuts + cuts + 2) `div` 2

main :: IO ()
main = putStrLn (unwords (map (show . pieces) [0 .. 9])) -- 1 2 4 7 11 16 22 29 37 46
