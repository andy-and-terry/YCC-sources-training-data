import Data.Bits (shiftL, (.&.), (.|.))
import qualified Data.Map as M

bitap :: String -> String -> Maybe Int
bitap text pat = go 0 0 text
  where
    masks = M.fromListWith (.|.) [(c, 1 `shiftL` i) | (i, c) <- zip [0 ..] pat] :: M.Map Char Int
    goal = 1 `shiftL` (length pat - 1)
    go _ _ [] = Nothing
    go i st (c : cs) =
      let st' = ((st `shiftL` 1) .|. 1) .&. M.findWithDefault 0 c masks
      in if st' .&. goal /= 0 then Just (i - length pat + 1) else go (i + 1) st' cs

main :: IO ()
main = print (bitap "the quick brown fox" "brown")
