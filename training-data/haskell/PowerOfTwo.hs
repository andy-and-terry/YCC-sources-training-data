import Data.Bits ((.&.))

isPowerOfTwo :: Int -> Bool
isPowerOfTwo n = n > 0 && (n .&. (n - 1)) == 0

main :: IO ()
main = print (map isPowerOfTwo [1, 2, 3, 16, 18])
