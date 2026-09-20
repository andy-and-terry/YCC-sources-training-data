base :: Integer
base = 256

modulus :: Integer
modulus = 1000000007

charCode :: Char -> Integer
charCode = toInteger . fromEnum

hashOf :: String -> Integer
hashOf = foldl (\acc c -> (acc * base + charCode c) `mod` modulus) 0

-- Rolling hash of every length-m window of text, in order, computed via
-- Horner's method: each step slides the window by dropping the leading
-- character's contribution and folding in the next one.
rollingHashes :: Int -> String -> [Integer]
rollingHashes m text = scanl step h0 (zip text (drop m text))
  where
    h0 = hashOf (take m text)
    highOrder = (base ^ (m - 1)) `mod` modulus
    step h (removed, added) =
      ((h - charCode removed * highOrder) * base + charCode added) `mod` modulus

-- Rabin-Karp substring search: the rolling hash narrows candidates down to
-- O(n) comparisons, and each candidate is confirmed with a direct
-- comparison to rule out hash collisions.
rabinKarp :: String -> String -> [Int]
rabinKarp pattern text
  | m == 0 || m > n = []
  | otherwise =
      [ i
      | (i, h) <- zip [0 ..] (rollingHashes m text)
      , h == targetHash
      , take m (drop i text) == pattern
      ]
  where
    m = length pattern
    n = length text
    targetHash = hashOf pattern

main :: IO ()
main = do
  print (rabinKarp "abc" "abxabcabcaby")
  print (rabinKarp "xyz" "abxabcabcaby")
  print (rabinKarp "" "abc")
