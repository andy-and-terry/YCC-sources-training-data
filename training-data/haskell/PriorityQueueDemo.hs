import Data.List (insertBy)
import Data.Ord (comparing)

newtype PQueue a = PQueue [(Int, a)]

empty :: PQueue a
empty = PQueue []

insert :: Int -> a -> PQueue a -> PQueue a
insert priority item (PQueue xs) = PQueue (insertBy (comparing fst) (priority, item) xs)

extractMin :: PQueue a -> Maybe ((Int, a), PQueue a)
extractMin (PQueue []) = Nothing
extractMin (PQueue (x : xs)) = Just (x, PQueue xs)

toList :: PQueue a -> [(Int, a)]
toList (PQueue xs) = xs

drainAll :: PQueue a -> [(Int, a)]
drainAll pq = case extractMin pq of
  Nothing -> []
  Just (item, rest) -> item : drainAll rest

main :: IO ()
main = do
  let pq = insert 3 "task-c" (insert 1 "task-a" (insert 2 "task-b" empty))
  print (toList pq)
  print (drainAll pq)
