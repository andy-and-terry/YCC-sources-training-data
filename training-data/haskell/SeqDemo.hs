import Data.Foldable (toList)
import Data.Sequence (Seq, ViewL (..), viewl, (<|), (|>))
import qualified Data.Sequence as Seq

main :: IO ()
main = do
  let s = Seq.fromList [1 .. 5 :: Int]
      s2 = 0 <| s |> 6
  print (toList s2)
  print (Seq.length s2, Seq.index s2 3)
  print (toList (Seq.update 2 99 s2))
  print (toList (Seq.reverse s2))
  case viewl s2 of
    x :< rest -> print (x, toList rest)
    EmptyL -> putStrLn "empty"
  print (toList (Seq.sort (Seq.fromList [3, 1, 2 :: Int])))
