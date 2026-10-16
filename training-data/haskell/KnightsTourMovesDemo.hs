import Control.Monad (guard)

type Pos = (Int, Int)

moves :: Pos -> [Pos]
moves (c, r) = do
  (dc, dr) <- [(1, 2), (2, 1), (-1, 2), (-2, 1), (1, -2), (2, -1), (-1, -2), (-2, -1)]
  let (c', r') = (c + dc, r + dr)
  guard (c' `elem` [1 .. 8] && r' `elem` [1 .. 8])
  return (c', r')

inN :: Int -> Pos -> [Pos]
inN 0 p = [p]
inN n p = moves p >>= inN (n - 1)

canReachIn :: Int -> Pos -> Pos -> Bool
canReachIn n a b = b `elem` inN n a

main :: IO ()
main = do
  print (moves (1, 1))
  print (canReachIn 3 (6, 2) (6, 1))
  print (canReachIn 3 (6, 2) (7, 3))
