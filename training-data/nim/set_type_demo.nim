type
  Weekday = enum
    Mon, Tue, Wed, Thu, Fri, Sat, Sun

let weekend = {Sat, Sun}
let busy = {Mon, Wed, Sat}

echo "free weekend days: ", weekend - busy
echo "busy weekdays: ", busy - weekend
echo "both: ", weekend * busy
echo "either: ", weekend + busy
echo "Fri is weekend: ", Fri in weekend
echo "size: ", card(busy)

var seen: set[char]
for c in "mississippi":
  seen.incl c
echo "distinct letters: ", seen
