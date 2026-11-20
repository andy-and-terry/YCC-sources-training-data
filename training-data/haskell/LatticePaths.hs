-- Lattice paths with iterate over DP rows.
lattice :: Int -> Integer
lattice n = last (iterate (scanl1 (+)) (replicate (n + 1) 1) !! n)

main :: IO ()
main = print (lattice 3)
