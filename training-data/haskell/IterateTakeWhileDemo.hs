powersOfTwo :: [Integer]
powersOfTwo = iterate (* 2) 1

newton :: Double -> Double
newton x = fst . head . dropWhile (\(a, b) -> abs (a - b) > 1e-12) $ zip xs (tail xs)
  where xs = iterate (\g -> (g + x / g) / 2) x

digits :: Int -> [Int]
digits = reverse . map (`mod` 10) . takeWhile (> 0) . iterate (`div` 10)

main :: IO ()
main = do
  print (takeWhile (< 100) powersOfTwo)
  print (newton 2)
  print (digits 90210)
  print (span even [2, 4, 5, 6], break (> 3) [1 .. 6])
  print (dropWhile (< 3) [1 .. 6], splitAt 2 "hello")
