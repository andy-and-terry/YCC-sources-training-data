import Data.List (group)

nextTerm :: String -> String
nextTerm = concatMap (\g -> show (length g) ++ [head g]) . group

main :: IO ()
main = mapM_ putStrLn (take 8 (iterate nextTerm "1"))
