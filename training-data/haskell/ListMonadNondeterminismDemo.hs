import Data.List (permutations, nub)

coins :: [Int]
coins = [1, 5, 10]

change :: Int -> [[Int]]
change 0 = [[]]
change n = [c : rest | c <- coins, c <= n, rest <- change (n - c), null rest || c >= head rest]

sendMore :: [(Int, Int, Int)]
sendMore = [ (a, b, c) | a <- [1 .. 9], b <- [0 .. 9], b /= a, c <- [0 .. 9], c /= a, c /= b, 10 * a + b + c == 21 ]

main :: IO ()
main = do
  print (length (change 20))
  print (take 3 (change 12))
  print (take 5 sendMore)
  print (length (nub (permutations "aabb")))
  print (do { x <- [1, 2]; y <- "ab"; return (x, y) })
