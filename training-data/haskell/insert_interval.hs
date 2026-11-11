type Interval = (Int, Int)

insertInterval :: [Interval] -> Interval -> [Interval]
insertInterval ivs new = before ++ [merged] ++ after
  where
    (before, rest) = span (\(_, h) -> h < fst new) ivs
    (overlap, after) = span (\(l, _) -> l <= snd new) rest
    merged = foldl (\(lo, hi) (l, h) -> (min lo l, max hi h)) new overlap

main :: IO ()
main = print (insertInterval [(1, 3), (6, 9)] (2, 5)) -- [(1,5),(6,9)]
