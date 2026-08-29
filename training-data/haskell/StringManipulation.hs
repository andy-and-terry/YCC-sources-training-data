import Data.Char (toUpper, toLower)
import Data.List (intercalate)

capitalize :: String -> String
capitalize [] = []
capitalize (c:cs) = toUpper c : map toLower cs

reverseWords :: String -> String
reverseWords = intercalate " " . reverse . words

main :: IO ()
main = do
  putStrLn (capitalize "hELLO wORLD")
  putStrLn (reverseWords "the quick brown fox")
