function! Josephus(n, k)
  let people = range(1, a:n)
  let idx = 0
  while len(people) > 1
    let idx = (idx + a:k - 1) % len(people)
    call remove(people, idx)
  endwhile
  return people[0]
endfunction

echo Josephus(7, 3)
echo Josephus(1, 5)
echo Josephus(5, 2)
