import qualified Data.Set as Set
import Data.Set (Set)

-- A tiny hand-rolled bloom filter using two hash functions over a fixed
-- bit array size, represented as the set of set bit indices.
size :: Int
size = 64

hash1 :: String -> Int
hash1 = (`mod` size) . foldl (\acc c -> acc * 31 + fromEnum c) 7

hash2 :: String -> Int
hash2 = (`mod` size) . foldl (\acc c -> acc * 17 + fromEnum c) 13

addItem :: Set Int -> String -> Set Int
addItem bits item = Set.insert (hash1 item) (Set.insert (hash2 item) bits)

mightContain :: Set Int -> String -> Bool
mightContain bits item = Set.member (hash1 item) bits && Set.member (hash2 item) bits

main :: IO ()
main = do
  let bits = foldl addItem Set.empty ["apple", "banana"]
  print (mightContain bits "apple")
  print (mightContain bits "cherry")
