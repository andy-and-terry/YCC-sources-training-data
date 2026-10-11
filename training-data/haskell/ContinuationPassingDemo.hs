factCPS :: Integer -> (Integer -> r) -> r
factCPS 0 k = k 1
factCPS n k = factCPS (n - 1) (k . (* n))

fibCPS :: Int -> (Int -> r) -> r
fibCPS n k
  | n < 2 = k n
  | otherwise = fibCPS (n - 1) $ \a -> fibCPS (n - 2) $ \b -> k (a + b)

safeDivCPS :: Int -> Int -> (String -> r) -> (Int -> r) -> r
safeDivCPS _ 0 err _ = err "div by zero"
safeDivCPS a b _ ok = ok (a `div` b)

main :: IO ()
main = do
  print (factCPS 10 id)
  print (fibCPS 15 id)
  putStrLn (safeDivCPS 10 0 id show)
  putStrLn (safeDivCPS 10 3 id show)
