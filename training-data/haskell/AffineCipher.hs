import Data.Char (chr, isUpper, ord)

modInverse :: Int -> Int -> Int
modInverse a m = head [x | x <- [1 .. m - 1], a * x `mod` m == 1]

affine :: Int -> Int -> Bool -> String -> String
affine a b dec = map step
  where
    inv = modInverse a 26
    step ch
      | isUpper ch =
          let x = ord ch - 65
              y = if dec then inv * (x - b) `mod` 26 else (a * x + b) `mod` 26
           in chr (y + 65)
      | otherwise = ch

main :: IO ()
main = do
  let c = affine 5 8 False "AFFINE"
  putStrLn (c ++ " " ++ affine 5 8 True c)
