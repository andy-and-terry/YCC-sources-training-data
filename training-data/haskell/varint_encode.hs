import Data.Bits (shiftR, (.&.), (.|.))
import Numeric (showHex)

varint :: Int -> [Int]
varint n
  | n < 128 = [n]
  | otherwise = ((n .&. 127) .|. 128) : varint (n `shiftR` 7)

main :: IO ()
main = putStrLn (unwords [showHex b "" | b <- varint 300])
