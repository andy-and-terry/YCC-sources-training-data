triples :: Int -> [(Int, Int, Int)]
triples n = [(a, b, c) | c <- [1 .. n], b <- [1 .. c], a <- [1 .. b], a * a + b * b == c * c]

main :: IO ()
main = print (triples 30)
