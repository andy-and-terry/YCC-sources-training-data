import Data.Bits (shiftL, shiftR, (.&.), (.|.))

reverseBits :: Int -> Int -> Int
reverseBits width v = go width v 0
  where
    go 0 _ acc = acc
    go k x acc = go (k - 1) (x `shiftR` 1) ((acc `shiftL` 1) .|. (x .&. 1))

main :: IO ()
main = mapM_ (\v -> putStrLn (show v ++ " " ++ show (reverseBits 8 v))) [1, 6, 13, 128]
-- 128 96 176 1
