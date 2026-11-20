-- Bead (gravity) sort.
beadSort :: [Int] -> [Int]
beadSort nums = reverse [length (filter (>= r) cols) | r <- [1 .. length nums]]
  where cols = [length (filter (>= i) nums) | i <- [1 .. maximum nums]]

main :: IO ()
main = print (beadSort [5, 3, 1, 4, 2])
