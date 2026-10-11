{-# LANGUAGE MultiWayIf, ViewPatterns #-}

import Data.Char (toLower)
import Data.List (stripPrefix)

grade :: Int -> Char
grade n = if | n >= 90 -> 'A'
             | n >= 80 -> 'B'
             | n >= 70 -> 'C'
             | otherwise -> 'F'

command :: String -> String
command (stripPrefix "say " -> Just rest) = "saying: " ++ rest
command (map toLower -> "quit") = "bye"
command (words -> [a, b]) = "two words: " ++ a ++ "," ++ b
command _ = "unknown"

main :: IO ()
main = do
  print (map grade [95, 85, 75, 10])
  mapM_ (putStrLn . command) ["say hello", "QUIT", "foo bar", "x"]
