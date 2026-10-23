import Data.List (sort)

type Point = (Int, Int)

cross :: Point -> Point -> Point -> Int
cross (ox, oy) (ax, ay) (bx, by) = (ax - ox) * (by - oy) - (ay - oy) * (bx - ox)

-- One monotone chain pass; the accumulator keeps the newest point first.
chain :: [Point] -> [Point]
chain = reverse . foldl step []
  where
    step (b : a : rest) q | cross a b q <= 0 = step (a : rest) q
    step acc q = q : acc

convexHull :: [Point] -> [Point]
convexHull pts
  | length ps < 3 = ps
  | otherwise = init (chain ps) ++ init (chain (reverse ps))
  where
    ps = sort pts

main :: IO ()
main = print (convexHull [(0, 0), (2, 0), (1, 1), (2, 2), (0, 2), (1, 3)])
