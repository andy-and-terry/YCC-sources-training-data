import Data.Bits
import Data.Word

popc :: Int -> Int
popc = popCount

main :: IO ()
main = do
  print (5 .&. 3 :: Int, 5 .|. 3 :: Int, xor 5 3 :: Int, shiftL 1 10 :: Int, shiftR 1024 3 :: Int)
  print (popc 255, testBit (5 :: Int) 2, setBit (0 :: Int) 4, clearBit (31 :: Int) 0, complement 0 :: Int)
  print (fromIntegral (300 :: Int) :: Word8, maxBound :: Word16, (maxBound :: Int) + 1 == minBound)
  print (rotateL (0x81 :: Word8) 1, countLeadingZeros (1 :: Word32))
