import Data.Bits (shiftL, xor, (.&.))
import Data.Char (ord)
import Numeric (showHex)

step :: Int -> Int
step c
  | c .&. 0x80 /= 0 = ((c `shiftL` 1) `xor` 0x07) .&. 0xFF
  | otherwise = (c `shiftL` 1) .&. 0xFF

crc8 :: String -> Int
crc8 = foldl (\crc ch -> iterate step (crc `xor` ord ch) !! 8) 0

main :: IO ()
main = putStrLn (showHex (crc8 "123456789") "")
