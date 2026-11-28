import Data.Bits (popCount, (.&.))

popcount :: Int -> Int
popcount 0 = 0
popcount n = 1 + popcount (n .&. (n - 1))

main :: IO ()
main = print (popcount 0xB7, popCount (0xB7 :: Int))
