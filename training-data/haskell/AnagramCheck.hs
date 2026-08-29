import Data.List (sort)

isAnagram :: String -> String -> Bool
isAnagram a b = sort a == sort b

main :: IO ()
main = print (isAnagram "listen" "silent")
