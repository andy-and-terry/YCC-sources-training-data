import Data.Sequence (Seq, (|>), (<|), ViewL(..), viewl)
import qualified Data.Sequence as Seq
import Data.Foldable (toList)

drain :: Seq a -> [a]
drain q = case viewl q of
  EmptyL  -> []
  x :< xs -> x : drain xs

main :: IO ()
main = do
  let q = Seq.fromList [1, 2, 3] |> 4
      q' = 0 <| q
  print (toList q')
  print (Seq.length q', Seq.index q' 2)
  print (toList (Seq.update 2 99 q'))
  print (toList (Seq.reverse q'))
  print (drain q')
  print (toList (Seq.sort (Seq.fromList [3, 1, 2])))
