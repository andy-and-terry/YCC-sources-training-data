import Data.List (group)

-- Remove consecutive duplicates.
dedupe :: Eq a => [a] -> [a]
dedupe = map head . group

main :: IO ()
main = putStrLn (dedupe "aabbbcdd")
