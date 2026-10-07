import Data.Char (toUpper, isDigit, isAlpha, ord, chr, isSpace, digitToInt)
import Data.List (intercalate, isPrefixOf, isSuffixOf, isInfixOf, group, sort, words)

capitalize :: String -> String
capitalize [] = []
capitalize (c : cs) = toUpper c : cs

main :: IO ()
main = do
  putStrLn (unwords (map capitalize (words "the quick brown fox")))
  print (filter isDigit "a1b22c3", sum (map digitToInt "1234"))
  print (map (chr . (+ 1) . ord) "HAL")
  print ("ab" `isPrefixOf` "abc", "bc" `isSuffixOf` "abc", "xx" `isInfixOf` "abc")
  putStrLn (intercalate ", " ["a", "b", "c"])
  print (map (\g -> (head g, length g)) (group (sort "mississippi")))
  print (dropWhile isSpace "   trim", lines "a\nb\nc")
