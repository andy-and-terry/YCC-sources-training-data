data Tree a = Leaf | Node (Tree a) a (Tree a)

instance Foldable Tree where
  foldr _ z Leaf = z
  foldr f z (Node left value right) = foldr f (f value (foldr f z right)) left

sampleTree :: Tree Int
sampleTree = Node (Node Leaf 1 Leaf) 2 (Node (Node Leaf 3 Leaf) 4 Leaf)

main :: IO ()
main = do
  print (sum sampleTree)
  print (length sampleTree)
  print (maximum sampleTree)
  print (foldr (:) [] sampleTree)
  print (elem 3 sampleTree)
  print (any even sampleTree)
