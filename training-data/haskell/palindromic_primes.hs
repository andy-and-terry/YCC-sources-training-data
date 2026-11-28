isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

isPalindrome :: Int -> Bool
isPalindrome n = show n == reverse (show n)

main :: IO ()
main = print [n | n <- [2 .. 199], isPalindrome n, isPrime n]
-- [2,3,5,7,11,101,131,151,181,191]
