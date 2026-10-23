import Data.Bits (popCount)

-- Thue-Morse: t(n) is the parity of the number of 1 bits in n
main :: IO ()
main = putStrLn [if even (popCount n) then '0' else '1' | n <- [0 .. 31 :: Int]]
