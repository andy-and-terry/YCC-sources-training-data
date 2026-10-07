import Data.Char (digitToInt, isDigit)

isValidIsbn10 :: String -> Bool
isValidIsbn10 isbn = case filter (/= '-') isbn of
  s | length s == 10, all isDigit (init s), isDigit (last s) || last s == 'X' ->
        sum (zipWith (*) [10, 9 .. 1] (map value s)) `mod` 11 == 0
  _ -> False
  where
    value 'X' = 10
    value c = digitToInt c

main :: IO ()
main = mapM_ (\s -> putStrLn (s ++ " " ++ show (isValidIsbn10 s))) ["3-598-21508-8", "3-598-21507-X", "3-598-21508-9"]
