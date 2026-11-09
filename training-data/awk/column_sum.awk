# sum the second column
{ sum += $2 }
END { print "total:", sum }
