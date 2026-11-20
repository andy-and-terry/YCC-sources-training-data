-- Goldbach pair using list comprehension.
isPrime :: Int -> Bool
isPrime n = n > 1 && all ((/= 0) . mod n) (takeWhile (\d -> d * d <= n) [2 ..])

goldbach :: Int -> Maybe (Int, Int)
goldbach n = case [(p, n - p) | p <- [2 .. n `div` 2], isPrime p, isPrime (n - p)] of
  (x : _) -> Just x
  [] -> Nothing

main :: IO ()
main = print (goldbach 28)
