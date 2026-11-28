columnTitle :: Int -> String
columnTitle 0 = ""
columnTitle n = columnTitle ((n - 1) `div` 26) ++ [toEnum (fromEnum 'A' + (n - 1) `mod` 26)]

main :: IO ()
main = putStrLn (columnTitle 28 ++ " " ++ columnTitle 701) -- AB ZY
