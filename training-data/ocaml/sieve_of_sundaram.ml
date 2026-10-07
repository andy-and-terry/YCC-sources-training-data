let sieve_of_sundaram limit =
  let n = limit / 2 in
  let marked = Array.make (n + 1) false in
  for i = 1 to n do
    let j = ref i in
    while i + !j + (2 * i * !j) <= n do
      marked.(i + !j + (2 * i * !j)) <- true;
      incr j
    done
  done;
  let primes = ref [ 2 ] in
  for k = 1 to n do
    if not marked.(k) then primes := ((2 * k) + 1) :: !primes
  done;
  List.rev !primes

let () =
  List.iter (Printf.printf "%d ") (sieve_of_sundaram 50);
  print_newline ()
