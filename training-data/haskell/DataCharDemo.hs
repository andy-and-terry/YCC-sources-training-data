import Data.Char

caesar :: Int -> String -> String
caesar n = map shift
  where
    shift c
      | isLower c = rot 'a' c
      | isUpper c = rot 'A' c
      | otherwise = c
    rot base c = chr (ord base + (ord c - ord base + n) `mod` 26)

main :: IO ()
main = do
  putStrLn (map toUpper "hello")
  print (filter isDigit "a1b2c3")
  print (digitToInt 'f', intToDigit 11)
  print (ord 'A', chr 97)
  print (isAlpha 'x', isSpace ' ', isPunctuation '!')
  putStrLn (caesar 3 "Hello, World!")
  putStrLn (caesar (-3) (caesar 3 "Hello, World!"))
