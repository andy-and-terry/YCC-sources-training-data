import qualified Data.Map.Strict as Map

histogram :: Int -> String -> [String]
histogram width s = [line k n | (k, n) <- Map.toAscList counts]
  where
    counts = Map.fromListWith (+) [(c, 1 :: Int) | c <- s]
    peak = maximum (Map.elems counts)
    line k n = k : " | " ++ replicate (max 1 (n * width `div` peak)) '#' ++ " " ++ show n

main :: IO ()
main = mapM_ putStrLn (histogram 30 "theraininspainfallsmainlyontheplain")
