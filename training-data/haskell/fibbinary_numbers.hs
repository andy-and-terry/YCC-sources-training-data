import Data.Bits ((.&.), shiftR)

-- Fibbinary numbers: no two adjacent 1 bits.
isFibbinary :: Int -> Bool
isFibbinary n = n .&. (n `shiftR` 1) == 0

main :: IO ()
main = putStrLn (unwords (map show (filter isFibbinary [0 .. 49])))
