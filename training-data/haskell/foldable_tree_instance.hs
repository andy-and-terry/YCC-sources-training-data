data Tree a = Leaf | Node (Tree a) a (Tree a)

instance Foldable Tree where
  foldr _ z Leaf = z
  foldr f z (Node l x r) = foldr f (f x (foldr f z r)) l

main :: IO ()
main = do
  let t = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)
  print (sum t, length t, foldr (:) [] t)
