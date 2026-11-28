import Data.Bits ((.&.))

main :: IO ()
main = mapM_ row [0 .. n - 1]
  where
    n = 8 :: Int
    row r = putStrLn (replicate (n - r - 1) ' ' ++ concat [ if r .&. c == c then "* " else "  " | c <- [0 .. r] ])
