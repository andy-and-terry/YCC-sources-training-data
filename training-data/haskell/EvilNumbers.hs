import Data.Bits (popCount)

-- Evil numbers have an even number of 1 bits.
main :: IO ()
main = putStrLn . unwords . map show $ filter (even . popCount) [0 .. 20 :: Int]
