import Data.List (sort)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
  deriving (Show, Eq, Ord, Enum, Bounded)

data Card = Card { rank :: Rank, suit :: String }

instance Eq Card where
  (Card r1 _) == (Card r2 _) = r1 == r2

instance Ord Card where
  compare (Card r1 _) (Card r2 _) = compare r1 r2

instance Show Card where
  show (Card r s) = show r ++ " of " ++ s

main :: IO ()
main = do
  let hand = [Card King "Spades", Card Two "Hearts", Card Ace "Clubs", Card Ten "Diamonds"]
  mapM_ print (sort hand)
  print (maximum hand)
  print (Card Ace "Clubs" == Card Ace "Hearts")
