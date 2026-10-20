import Data.Char

caesar :: Int -> String -> String
caesar n = map shift
  where shift c | isLower c = rot 'a' c
                | isUpper c = rot 'A' c
                | otherwise = c
        rot b c = chr (ord b + (ord c - ord b + n) `mod` 26)

isPalin :: String -> Bool
isPalin s = t == reverse t where t = map toLower (filter isAlphaNum s)

main :: IO ()
main = do
  print (words "  the quick  brown fox ", unwords ["a", "b"], lines "x\ny\n", unlines ["p", "q"])
  putStrLn (caesar 3 "Hello, World!")
  print (isPalin "A man, a plan, a canal: Panama")
  print (map toUpper "shout", digitToInt 'f', intToDigit 11, ord 'A', show 3.5, read "[1,2]" :: [Int])
