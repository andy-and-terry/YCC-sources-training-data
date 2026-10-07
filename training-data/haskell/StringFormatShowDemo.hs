import Data.Char (toUpper, isDigit, isSpace)
import Data.List (intercalate, isPrefixOf, isSuffixOf, isInfixOf)
import Numeric (showHex, showFFloat, showOct, readHex)

padLeft :: Int -> String -> String
padLeft n s = replicate (n - length s) ' ' ++ s

padRight :: Int -> String -> String
padRight n s = s ++ replicate (n - length s) ' '

main :: IO ()
main = do
  putStrLn (padLeft 8 "right" ++ "|" ++ padRight 8 "left" ++ "|")
  putStrLn (showHex (255 :: Int) "" ++ " " ++ showOct (64 :: Int) "")
  putStrLn (showFFloat (Just 3) (3.14159 :: Double) "")
  print (fst (head (readHex "ff" :: [(Int, String)])))
  print (show (Just 3), show [1, 2, 3 :: Int], show "quote\"d")
  print (read "[1,2,3]" :: [Int])
  print (read "(1,\"a\")" :: (Int, String))
  putStrLn (intercalate ", " (map (map toUpper) ["a", "bc"]))
  print (words "  split   these words ", unwords ["a", "b"])
  print (lines "one\ntwo\n", unlines ["x", "y"])
  print ("ab" `isPrefixOf` "abc", "bc" `isSuffixOf` "abc", "xx" `isInfixOf` "abc")
  print (span isDigit "123abc", dropWhile isSpace "   hi")
