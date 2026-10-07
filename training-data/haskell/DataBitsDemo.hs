import Data.Bits

main :: IO ()
main = do
  let x = 0b101100 :: Int
  print (popCount x)
  print (x .&. 0xF, x .|. 1, xor x 0xFF)
  print (shiftL x 2, shiftR x 2)
  print (testBit x 2, testBit x 0)
  print (setBit x 0, clearBit x 2, complementBit x 5)
  print (x .&. (x - 1) == 0)
  print (countTrailingZeros x, finiteBitSize x)
