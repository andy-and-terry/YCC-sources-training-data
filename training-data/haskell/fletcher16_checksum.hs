import Data.Char (ord)
import Data.Bits (shiftL, (.|.))
import Numeric (showHex)

fletcher16 :: String -> Int
fletcher16 = finish . foldl step (0, 0)
  where
    step (s1, s2) c = let a = (s1 + ord c) `mod` 255 in (a, (s2 + a) `mod` 255)
    finish (s1, s2) = (s2 `shiftL` 8) .|. s1

main :: IO ()
main = putStrLn (showHex (fletcher16 "abcde") "")
