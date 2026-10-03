import qualified Data.Set as Set
import Data.Set (Set)

type Grid = [[Char]]

numIslands :: Grid -> Int
numIslands grid = go allLand Set.empty 0
  where
    rows = length grid
    cols = if rows == 0 then 0 else length (head grid)
    at (r, c) = grid !! r !! c
    allLand = [(r, c) | r <- [0 .. rows - 1], c <- [0 .. cols - 1], at (r, c) == '1']

    go [] _ count = count
    go (p : ps) visited count
      | Set.member p visited = go ps visited count
      | otherwise = go ps (flood p visited) (count + 1)

    flood p visited
      | Set.member p visited = visited
      | not (inBounds p) || at p /= '1' = visited
      | otherwise =
          let visited' = Set.insert p visited
              (r, c) = p
          in foldr flood visited' [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]

    inBounds (r, c) = r >= 0 && r < rows && c >= 0 && c < cols

main :: IO ()
main = do
  let grid =
        [ "11000"
        , "11000"
        , "00100"
        , "00011"
        ]
  print (numIslands grid)
