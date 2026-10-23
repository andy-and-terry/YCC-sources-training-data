kolakoski :: [Int]
kolakoski = 1 : 2 : 2 : concat (zipWith replicate (drop 2 kolakoski) (cycle [1, 2]))

main :: IO ()
main = putStrLn (unwords (map show (take 20 kolakoski)))
