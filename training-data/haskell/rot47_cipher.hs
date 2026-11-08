import Data.Char (chr, ord)

rot47 :: String -> String
rot47 = map f
  where
    f c
      | n >= 33 && n <= 126 = chr (33 + (n - 33 + 47) `mod` 94)
      | otherwise = c
      where n = ord c

main :: IO ()
main = do
  let e = rot47 "Hello, World!"
  putStrLn (e ++ " " ++ rot47 e)
