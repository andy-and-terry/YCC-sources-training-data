isArmstrong :: Int -> Bool
isArmstrong n = n == sum [d ^ k | d <- digits]
  where
    s = show n
    k = length s
    digits = map (\c -> read [c]) s

main :: IO ()
main = print (filter isArmstrong [1 .. 1000])
