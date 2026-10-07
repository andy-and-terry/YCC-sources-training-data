let ages = {'alice': 30, 'bob': 25, 'carol': 35}

" Keys come back in arbitrary order, so sort for stable output
for key in sort(keys(ages))
  echo key . ' => ' . ages[key]
endfor

" items() yields [key, value] pairs
for [name, age] in sort(items(ages))
  echo name . ' is ' . age
endfor

echo sort(values(ages), 'n')
echo has_key(ages, 'bob')
call remove(ages, 'bob')
echo len(ages)
