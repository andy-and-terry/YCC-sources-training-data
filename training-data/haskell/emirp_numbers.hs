-- Emirps: primes whose digit reversal is a different prime.
isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\i -> n `mod` i /= 0) (takeWhile (\i -> i * i <= n) [2 ..])

reverseDigits :: Int -> Int
reverseDigits = read . reverse . show

main :: IO ()
main = print [n | n <- [2 .. 99], let r = reverseDigits n, r /= n, isPrime n, isPrime r]
