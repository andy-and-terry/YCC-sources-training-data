shoelace :: [(Double, Double)] -> Double
shoelace pts = abs (sum (zipWith cross pts (tail pts ++ [head pts]))) / 2
  where cross (x1, y1) (x2, y2) = x1 * y2 - x2 * y1

main :: IO ()
main = print (shoelace [(0, 0), (4, 0), (4, 3), (0, 3)])
