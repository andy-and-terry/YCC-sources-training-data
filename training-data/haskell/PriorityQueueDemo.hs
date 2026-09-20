-- A leftist heap: a purely functional priority queue. Each node tracks the
-- "rank" (length of its right spine), and merge always attaches the
-- shorter spine on the right, which keeps merge/insert/deleteMin O(log n).
data Heap a = Leaf | Node Int a (Heap a) (Heap a)

rank :: Heap a -> Int
rank Leaf = 0
rank (Node r _ _ _) = r

merge :: (Ord a) => Heap a -> Heap a -> Heap a
merge h Leaf = h
merge Leaf h = h
merge h1@(Node _ x l1 r1) h2@(Node _ y l2 r2)
  | x <= y = makeNode x l1 (merge r1 h2)
  | otherwise = makeNode y l2 (merge h1 r2)
  where
    makeNode v a b
      | rank a >= rank b = Node (rank b + 1) v a b
      | otherwise = Node (rank a + 1) v b a

insert :: (Ord a) => a -> Heap a -> Heap a
insert x = merge (Node 1 x Leaf Leaf)

findMin :: Heap a -> Maybe a
findMin Leaf = Nothing
findMin (Node _ x _ _) = Just x

deleteMin :: (Ord a) => Heap a -> Heap a
deleteMin Leaf = Leaf
deleteMin (Node _ _ l r) = merge l r

fromList :: (Ord a) => [a] -> Heap a
fromList = foldr insert Leaf

toSortedList :: (Ord a) => Heap a -> [a]
toSortedList Leaf = []
toSortedList h@(Node {}) =
  case findMin h of
    Nothing -> []
    Just x -> x : toSortedList (deleteMin h)

main :: IO ()
main = do
  let heap = fromList [5, 3, 8, 1, 9, 2, 3 :: Int]
  print (findMin heap)
  print (toSortedList heap)
