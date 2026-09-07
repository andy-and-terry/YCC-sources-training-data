import Data.Array
import Data.Bits ((.&.))

type Fenwick = Array Int Int

newFenwick :: Int -> Fenwick
newFenwick n = listArray (0, n) (replicate (n + 1) 0)

update :: Fenwick -> Int -> Int -> Fenwick
update tree i0 delta = go tree i0
  where
    size = snd (bounds tree)
    go t i
      | i > size = t
      | otherwise = go (t // [(i, t ! i + delta)]) (i + (i .&. (-i)))

prefixSum :: Fenwick -> Int -> Int
prefixSum tree i0 = go 0 i0
  where
    go acc i
      | i <= 0 = acc
      | otherwise = go (acc + tree ! i) (i - (i .&. (-i)))

rangeSum :: Fenwick -> Int -> Int -> Int
rangeSum tree l r = prefixSum tree r - prefixSum tree (l - 1)

main :: IO ()
main = do
  let values = [3, 2, -1, 6, 5, 4, -3, 3, 7, 2]
      n = length values
      built = foldl (\t (i, v) -> update t i v) (newFenwick n) (zip [1 ..] values)
  print (rangeSum built 1 5)
  let built2 = update built 3 4
  print (rangeSum built2 1 5)
