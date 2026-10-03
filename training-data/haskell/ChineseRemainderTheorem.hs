extGCD :: Int -> Int -> (Int, Int, Int)
extGCD a 0 = (a, 1, 0)
extGCD a b =
  let (g, x1, y1) = extGCD b (a `mod` b)
  in (g, y1, x1 - (a `div` b) * y1)

modInverse :: Int -> Int -> Int
modInverse a m = let (_, x, _) = extGCD a m in ((x `mod` m) + m) `mod` m

-- Solves x = remainders[i] (mod moduli[i]) for all i, assuming the
-- moduli are pairwise coprime.
crt :: [Int] -> [Int] -> Int
crt remainders moduli = ((sum terms) `mod` prod + prod) `mod` prod
  where
    prod = product moduli
    terms = zipWith term remainders moduli
    term r m =
      let partial = prod `div` m
          inv = modInverse partial m
      in r * partial * inv

main :: IO ()
main = print (crt [2, 3, 2] [3, 5, 7])
