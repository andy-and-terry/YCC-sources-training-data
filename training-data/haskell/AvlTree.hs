data AvlTree = Leaf | Node AvlTree Int Int AvlTree
  -- Node left value height right

height :: AvlTree -> Int
height Leaf = 0
height (Node _ _ h _) = h

mkNode :: AvlTree -> Int -> AvlTree -> AvlTree
mkNode l v r = Node l v (1 + max (height l) (height r)) r

balanceFactor :: AvlTree -> Int
balanceFactor Leaf = 0
balanceFactor (Node l _ _ r) = height l - height r

rotateRight :: AvlTree -> AvlTree
rotateRight (Node (Node ll lv _ lr) v _ r) = mkNode ll lv (mkNode lr v r)
rotateRight t = t

rotateLeft :: AvlTree -> AvlTree
rotateLeft (Node l v _ (Node rl rv _ rr)) = mkNode (mkNode l v rl) rv rr
rotateLeft t = t

rebalance :: AvlTree -> AvlTree
rebalance t@(Node l v _ r)
  | bf > 1 && balanceFactor l >= 0 = rotateRight t
  | bf > 1 = rotateRight (mkNode (rotateLeft l) v r)
  | bf < -1 && balanceFactor r <= 0 = rotateLeft t
  | bf < -1 = rotateLeft (mkNode l v (rotateRight r))
  | otherwise = t
  where bf = balanceFactor t
rebalance Leaf = Leaf

insert :: Int -> AvlTree -> AvlTree
insert x Leaf = mkNode Leaf x Leaf
insert x t@(Node l v _ r)
  | x < v = rebalance (mkNode (insert x l) v r)
  | x > v = rebalance (mkNode l v (insert x r))
  | otherwise = t

inorder :: AvlTree -> [Int]
inorder Leaf = []
inorder (Node l v _ r) = inorder l ++ [v] ++ inorder r

main :: IO ()
main = do
  let t = foldl (flip insert) Leaf [10, 20, 30, 40, 50, 25]
  print (inorder t)
  print (height t)
