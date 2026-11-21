-- Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
import Data.Char (digitToInt)

isMunchausen :: Int -> Bool
isMunchausen n = sum [if d == 0 then 0 else d ^ d | d <- map digitToInt (show n)] == n

main :: IO ()
main = putStrLn (unwords (map show (filter isMunchausen [1 .. 4999])))
