-- Palindromic primes below 200; expect 10.
isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = do
  let found = [n | n <- [2 .. 199], show n == reverse (show n), isPrime n]
  putStrLn (unwords (map show found))
  print (length found)
