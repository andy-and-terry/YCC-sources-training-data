import Data.List (group)

next :: String -> String
next = concatMap (\g -> show (length g) ++ [head g]) . group

main :: IO ()
main = mapM_ putStrLn (take 7 (iterate next "1"))
