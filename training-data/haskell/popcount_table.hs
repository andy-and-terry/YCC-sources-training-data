-- Population count (number of set bits) for 0..15
import Data.Bits (popCount)

main :: IO ()
main = putStrLn . unwords . map (show . popCount) $ [0 .. 15 :: Int]
