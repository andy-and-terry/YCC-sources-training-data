import qualified Data.Set as Set

step :: Int -> Int
step 0 = 0
step n = let (q, r) = n `divMod` 10 in r * r + step q

isHappy :: Int -> Bool
isHappy = go Set.empty
  where
    go _ 1 = True
    go seen n
      | n `Set.member` seen = False
      | otherwise = go (Set.insert n seen) (step n)

main :: IO ()
main = print (filter isHappy [1 .. 50])
