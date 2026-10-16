import Data.Char (isSpace, toUpper)
import Data.List (dropWhileEnd, intercalate, isPrefixOf, isSuffixOf, isInfixOf, stripPrefix)

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace

splitOn :: Char -> String -> [String]
splitOn c s = case break (== c) s of
  (a, [])     -> [a]
  (a, _:rest) -> a : splitOn c rest

main :: IO ()
main = do
  print (trim "   padded  ")
  print (splitOn ',' "a,b,,c")
  putStrLn (intercalate "-" ["x", "y", "z"])
  print ("ab" `isPrefixOf` "abc", "bc" `isSuffixOf` "abc", "xx" `isInfixOf` "abc")
  print (stripPrefix "foo" "foobar")
  print (words "  hello   there world ", unwords ["a", "b"])
  print (lines "one\ntwo\n\nthree", unlines ["p", "q"])
  putStrLn (map toUpper "shout")
