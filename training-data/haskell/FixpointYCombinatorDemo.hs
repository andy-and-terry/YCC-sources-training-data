import Data.Function (fix)

factorial :: Integer -> Integer
factorial = fix (\rec n -> if n <= 1 then 1 else n * rec (n - 1))

fibs :: [Integer]
fibs = fix (\xs -> 0 : 1 : zipWith (+) xs (tail xs))

collatz :: Int -> [Int]
collatz = fix (\rec n -> n : if n == 1 then [] else rec (if even n then n `div` 2 else 3 * n + 1))

main :: IO ()
main = do
  print (factorial 20)
  print (take 12 fibs)
  print (collatz 6)
  print (take 5 (fix (1 :)))
