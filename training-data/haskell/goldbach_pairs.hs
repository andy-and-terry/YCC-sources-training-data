-- Goldbach partitions of 100; expect 6.
isPrime :: Int -> Bool
isPrime n = n > 1 && all (\d -> n `mod` d /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = do
  let pairs = [(p, 100 - p) | p <- [2 .. 50], isPrime p, isPrime (100 - p)]
  print (length pairs, pairs)
