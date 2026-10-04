import Data.Bits

showBinary :: Int -> String
showBinary 0 = "0"
showBinary n = reverse (go n)
  where
    go 0 = ""
    go k = (if testBit k 0 then '1' else '0') : go (k `shiftR` 1)

isPowerOfTwo :: Int -> Bool
isPowerOfTwo n = n > 0 && n .&. (n - 1) == 0

main :: IO ()
main = do
  let n = 0xB2 :: Int
  putStrLn (showBinary n)
  print (n .&. 0x0F, n .|. 0x01, n `xor` 0xFF)
  print (shiftL n 2, shiftR n 4)
  print (popCount n)
  print (testBit n 1, testBit n 7)
  print (setBit n 0, clearBit n 7, complementBit n 1)
  print (map isPowerOfTwo [1, 6, 16, 18, 64])
  print (complement 0 :: Int)
  print (countTrailingZeros (40 :: Int), countLeadingZeros (1 :: Int))
  print (foldr (\b acc -> acc * 2 + (if b then 1 else 0)) 0 [True, False, True, True] :: Int)
  print (finiteBitSize (0 :: Int))
