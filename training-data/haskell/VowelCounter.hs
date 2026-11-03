import Data.Char (toLower)

countVowels :: String -> [(Char, Int)]
countVowels s = [(v, length (filter (== v) lower)) | v <- "aeiou"]
  where lower = map toLower s

main :: IO ()
main = print (countVowels "Education is beautiful")
