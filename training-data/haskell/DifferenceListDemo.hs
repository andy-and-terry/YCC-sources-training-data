newtype DList a = DList ([a] -> [a])

empty :: DList a
empty = DList id

singleton :: a -> DList a
singleton x = DList (x :)

append :: DList a -> DList a -> DList a
append (DList f) (DList g) = DList (f . g)

toList :: DList a -> [a]
toList (DList f) = f []

fromList :: [a] -> DList a
fromList xs = DList (xs ++)

flattenLeft :: Int -> [Int]
flattenLeft n = toList (foldl append empty (map singleton [1 .. n]))

main :: IO ()
main = do
  print (toList (fromList [1, 2] `append` singleton 3 `append` fromList [4, 5]))
  print (sum (flattenLeft 10000))
