import std/[math, stats]

var rs: RunningStat
for x in [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]:
  rs.push x
echo rs.n
echo rs.mean
echo rs.variance
echo rs.standardDeviation
echo rs.min, " ", rs.max
