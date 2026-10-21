-- Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
jacobsthal :: [Integer]
jacobsthal = 0 : 1 : zipWith (\a b -> b + 2 * a) jacobsthal (tail jacobsthal)

main :: IO ()
main = putStrLn . unwords . map show $ take 15 jacobsthal
