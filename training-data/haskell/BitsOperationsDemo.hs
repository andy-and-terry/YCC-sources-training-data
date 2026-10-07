import Data.Bits

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
  print (popCount (255 :: Int))
  print (5 .|. 2 :: Int, 6 .&. 3 :: Int, xor 5 3 :: Int)
  print (shiftL 1 10 :: Int, shiftR 1024 3 :: Int)
  print (map isPowerOfTwo [1, 6, 64])
  putStrLn (toBinary 37)
  print (setBit (0 :: Int) 4, clearBit (31 :: Int) 0, complement 0 :: Int)
