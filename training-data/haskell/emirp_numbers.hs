-- Emirps: primes whose digit reversal is a different prime.
isPrime :: Int -> Bool
isPrime n = n >= 2 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

isEmirp :: Int -> Bool
isEmirp n = r /= n && isPrime n && isPrime r
  where r = read (reverse (show n))

main :: IO ()
main = putStrLn . unwords . map show $ filter isEmirp [2 .. 199]
