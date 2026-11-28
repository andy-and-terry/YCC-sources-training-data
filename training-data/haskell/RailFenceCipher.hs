import Data.List (sortOn)

order :: Int -> Int -> [Int]
order n k = map snd (sortOn fst [(rail i, i) | i <- [0 .. n - 1]])
  where
    cycleLen = 2 * (k - 1)
    rail i = let r = i `mod` cycleLen in if r < k then r else cycleLen - r

encrypt :: String -> Int -> String
encrypt t k = map (t !!) (order (length t) k)

decrypt :: String -> Int -> String
decrypt c k = map snd (sortOn fst (zip (order (length c) k) c))

main :: IO ()
main = do
  let c = encrypt "WEAREDISCOVERED" 3
  putStrLn (c ++ " " ++ decrypt c 3)
