import Data.Char (isAlpha, isDigit, isSpace, toUpper, ord, chr)
import Data.List (intercalate, isPrefixOf, isSuffixOf, isInfixOf, group, sort)

splitOn :: Char -> String -> [String]
splitOn d s = case break (== d) s of
  (a, []) -> [a]
  (a, _ : rest) -> a : splitOn d rest

capitalize :: String -> String
capitalize [] = []
capitalize (c : cs) = toUpper c : cs

trim :: String -> String
trim = f . f where f = reverse . dropWhile isSpace

main :: IO ()
main = do
  print (splitOn ',' "a,b,,c")
  putStrLn (intercalate " " (map capitalize (words "hello brave new world")))
  print (trim "   padded  ")
  print ("ab" `isPrefixOf` "abc", "bc" `isSuffixOf` "abc", "xx" `isInfixOf` "abc")
  print (filter isDigit "a1b22c3", length (filter isAlpha "a1b22c3"))
  print (map (\g -> (head g, length g)) (group (sort "mississippi")))
  print (map (\c -> chr ((ord c - 97 + 3) `mod` 26 + 97)) "xyz")
  print (lines "one\ntwo\nthree", unlines ["a", "b"])
