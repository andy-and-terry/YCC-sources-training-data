data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show, Eq, Ord, Enum, Bounded)

isWeekend :: Day -> Bool
isWeekend d = d == Saturday || d == Sunday

allDays :: [Day]
allDays = [minBound .. maxBound]

nextDay :: Day -> Day
nextDay Sunday = Monday
nextDay d = succ d

main :: IO ()
main = do
  print allDays
  print (filter isWeekend allDays)
  print (nextDay Friday)
  print (nextDay Sunday)
  print [Monday ..]
  print (succ Wednesday, pred Wednesday)
