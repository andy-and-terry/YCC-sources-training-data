import qualified Data.Sequence as Seq
import Data.Sequence (Seq, (|>), (<|), ViewL (..), viewl)
import Data.Foldable (toList)

-- Data.Sequence gives O(1) access at both ends: a handy deque.

-- Sliding window maximum using a simple window of recent items
slidingMax :: Int -> [Int] -> [Int]
slidingMax k xs = go Seq.empty xs
  where
    go _ [] = []
    go w (y : ys) =
      let w' = trim (w |> y)
          trim s
            | Seq.length s > k = Seq.drop 1 s
            | otherwise = s
          rest = go w' ys
      in if Seq.length w' == k then maximum w' : rest else rest

main :: IO ()
main = do
  let d = Seq.fromList [2, 3, 4] :: Seq Int
      d' = 1 <| (d |> 5)
  print (toList d')
  print (Seq.length d', Seq.index d' 2)
  case viewl d' of
    x :< rest -> putStrLn ("front " ++ show x ++ ", rest " ++ show (toList rest))
    EmptyL -> putStrLn "empty"
  print (toList (Seq.update 2 99 d'))
  print (toList (Seq.reverse d'))
  print (slidingMax 3 [1, 3, 2, 5, 4, 1, 6])
