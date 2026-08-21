fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fibonacci :: Int -> Integer
fibonacci n = fibs !! n

main :: IO ()
main = print (map fibonacci [0 .. 10])
