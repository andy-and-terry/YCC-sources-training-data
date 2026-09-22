module Main where

base :: Int
base = 256

modulus :: Int
modulus = 1000000007

polyHash :: String -> Int
polyHash = foldl (\acc c -> (acc * base + fromEnum c) `mod` modulus) 0

rabinKarp :: String -> String -> [Int]
rabinKarp pat txt
  | m == 0 || m > n = []
  | otherwise = matches 0 firstHash
  where
    m = length pat
    n = length txt
    hPat = polyHash pat
    highPow = iterate (\x -> (x * base) `mod` modulus) 1 !! (m - 1)
    firstHash = polyHash (take m txt)

    matches :: Int -> Int -> [Int]
    matches i h
      | i > n - m = []
      | otherwise =
          let here = [i | h == hPat && take m (drop i txt) == pat]
          in here ++ if i == n - m then [] else matches (i + 1) (nextHash i h)

    nextHash :: Int -> Int -> Int
    nextHash i h =
      let outC = fromEnum (txt !! i)
          inC = fromEnum (txt !! (i + m))
      in ((h - outC * highPow) * base + inC) `mod` modulus

main :: IO ()
main = do
  print (rabinKarp "abc" "abxabcabcaby")
  print (rabinKarp "xyz" "abcdef")
