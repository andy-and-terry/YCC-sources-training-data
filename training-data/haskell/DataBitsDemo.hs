import Data.Bits
import Data.Word
import Numeric (showHex)

popCountManual :: Int -> Int
popCountManual 0 = 0
popCountManual n = (n .&. 1) + popCountManual (n `shiftR` 1)

isPowerOfTwo :: Int -> Bool
isPowerOfTwo n = n > 0 && n .&. (n - 1) == 0

toBinary :: Int -> String
toBinary 0 = "0"
toBinary n = reverse (go n)
  where
    go 0 = ""
    go k = (if testBit k 0 then '1' else '0') : go (k `shiftR` 1)

main :: IO ()
main = do
  print (12 .&. 10 :: Int, 12 .|. 10 :: Int, xor 12 10 :: Int)
  print (shiftL 1 10 :: Int, shiftR 1024 3 :: Int)
  print (complement 0 :: Int)
  print (popCount (255 :: Int), popCountManual 255)
  print (map isPowerOfTwo [1, 6, 8, 1023, 1024])
  putStrLn (toBinary 37)
  print (setBit (0 :: Int) 3, clearBit (15 :: Int) 0, testBit (5 :: Int) 2)
  print (fromIntegral (300 :: Int) :: Word8)
  putStrLn (showHex (0xDEADBEEF :: Word32) "")
  print (rotateL (0x81 :: Word8) 1)
