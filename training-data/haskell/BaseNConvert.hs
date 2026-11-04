import Data.Char (intToDigit)
import Numeric (showIntAtBase, readHex)

toBase :: Int -> Int -> String
toBase base n = showIntAtBase base intToDigit' n ""
  where intToDigit' d = if d < 10 then intToDigit d else toEnum (fromEnum 'a' + d - 10)

main :: IO ()
main = do
  mapM_ (\b -> putStrLn ("255 in base " ++ show b ++ " = " ++ toBase b 255)) [2, 8, 16, 36]
  print (fst (head (readHex "ff" :: [(Int, String)])))
