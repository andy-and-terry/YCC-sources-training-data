let scores = {'Ada': 88, 'Bob': 72, 'Cleo': 95}

for key in sort(keys(scores))
  echo key . ': ' . scores[key]
endfor

echo has_key(scores, 'Ada')
echo has_key(scores, 'Zed')
