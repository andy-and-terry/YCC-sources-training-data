import Data.Bits (shiftL, shiftR, xor, popCount, (.&.), testBit)

grayCode :: Int -> [Int]
grayCode n = [i `xor` (i `shiftR` 1) | i <- [0 .. (1 `shiftL` n) - 1]]

toBinary :: Int -> Int -> String
toBinary width x = [if testBit x i then '1' else '0' | i <- [width - 1, width - 2 .. 0]]

isPowerOfTwo :: Int -> Bool
isPowerOfTwo n = n > 0 && n .&. (n - 1) == 0

main :: IO ()
main = do
  mapM_ (putStrLn . toBinary 3) (grayCode 3)
  print (popCount (45 :: Int))
  print (map isPowerOfTwo [64, 65])
