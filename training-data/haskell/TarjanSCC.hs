import qualified Data.Map as Map
import Data.Map (Map)
import Control.Monad.State

data TState = TState
  { tsIndex   :: Map Int Int
  , tsLow     :: Map Int Int
  , tsStack   :: [Int]
  , tsOnStack :: Map Int Bool
  , tsCounter :: Int
  , tsSccs    :: [[Int]]
  }

-- Tarjan's strongly connected components algorithm, threaded through
-- the State monad instead of mutable references.
tarjanScc :: Int -> Map Int [Int] -> [[Int]]
tarjanScc n adj = tsSccs (execState (mapM_ visitIfNew [0 .. n - 1]) initial)
  where
    initial = TState Map.empty Map.empty [] Map.empty 0 []

    visitIfNew v = do
      st <- get
      if Map.member v (tsIndex st) then pure () else strongConnect v

    strongConnect v = do
      st <- get
      let i = tsCounter st
      put st { tsIndex = Map.insert v i (tsIndex st)
             , tsLow = Map.insert v i (tsLow st)
             , tsCounter = i + 1
             , tsStack = v : tsStack st
             , tsOnStack = Map.insert v True (tsOnStack st)
             }
      mapM_ (visitEdge v) (Map.findWithDefault [] v adj)
      st2 <- get
      let lowV = tsLow st2 Map.! v
          idxV = tsIndex st2 Map.! v
      if lowV == idxV
        then do
          let (component, rest) = span (/= v) (tsStack st2)
              popped = component ++ [v]
              remaining = drop 1 rest
              onStack' = foldr (\x m -> Map.insert x False m) (tsOnStack st2) popped
          put st2 { tsStack = remaining, tsOnStack = onStack', tsSccs = popped : tsSccs st2 }
        else pure ()

    visitEdge v w = do
      st <- get
      if not (Map.member w (tsIndex st))
        then do
          strongConnect w
          st2 <- get
          let newLow = min (tsLow st2 Map.! v) (tsLow st2 Map.! w)
          put st2 { tsLow = Map.insert v newLow (tsLow st2) }
        else
          if Map.findWithDefault False w (tsOnStack st)
            then do
              let newLow = min (tsLow st Map.! v) (tsIndex st Map.! w)
              put st { tsLow = Map.insert v newLow (tsLow st) }
            else pure ()

main :: IO ()
main = do
  let adj = Map.fromList [(0, [1]), (1, [2, 3]), (2, [0]), (3, [4]), (4, [])]
  print (tarjanScc 5 adj)
