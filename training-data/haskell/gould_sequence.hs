import Data.Bits (popCount, shiftL)

gould :: Int -> Int
gould n = 1 `shiftL` popCount n

main :: IO ()
main = print (map gould [0 .. 15])
