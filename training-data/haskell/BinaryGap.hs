toBinary :: Int -> String
toBinary 0 = "0"
toBinary n = reverse (go n)
  where
    go 0 = ""
    go k = (if odd k then '1' else '0') : go (k `div` 2)

binaryGap :: Int -> Int
binaryGap = maximum . (0 :) . map length . splitOnes . dropWhile (== '0') . reverse . toBinary
  where
    splitOnes s = case break (== '1') s of
      (chunk, _ : rest) -> chunk : splitOnes rest
      (_, []) -> []

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " " ++ toBinary n ++ " " ++ show (binaryGap n))) [9, 529, 20, 15, 1041]
