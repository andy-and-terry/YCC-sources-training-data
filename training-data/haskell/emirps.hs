-- Emirps below 200; expect 15.
isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

rev :: Int -> Int
rev = read . reverse . show

main :: IO ()
main = do
  let found = [n | n <- [2 .. 199], rev n /= n, isPrime n, isPrime (rev n)]
  print (length found, found)
