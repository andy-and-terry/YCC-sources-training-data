import Data.Char (ord)

base :: Int
base = 256

modulus :: Int
modulus = 1000000007

hashOf :: String -> Int
hashOf = foldl (\acc c -> (acc * base + ord c) `mod` modulus) 0

rabinKarp :: String -> String -> [Int]
rabinKarp pattern text
  | m > n = []
  | otherwise = go 0 (hashOf (take m text)) highPow
  where
    m = length pattern
    n = length text
    pHash = hashOf pattern
    highPow = foldl (\acc _ -> (acc * base) `mod` modulus) 1 [1 .. m - 1]

    go i curHash pow
      | i > n - m = []
      | curHash == pHash && take m (drop i text) == pattern = i : rest
      | otherwise = rest
      where
        rest
          | i == n - m = []
          | otherwise = go (i + 1) nextHash pow
        nextHash =
          let removed = ord (text !! i)
              added = ord (text !! (i + m))
              rolled = (curHash - removed * pow) * base + added
          in ((rolled `mod` modulus) + modulus) `mod` modulus

main :: IO ()
main = print (rabinKarp "abc" "abxabcabcaby")
