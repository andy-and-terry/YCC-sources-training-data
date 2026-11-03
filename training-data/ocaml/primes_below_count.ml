let count_primes_below n =
  if n < 3 then 0
  else begin
    let composite = Array.make n false in
    let count = ref 0 in
    for i = 2 to n - 1 do
      if not composite.(i) then begin
        incr count;
        let j = ref (i * i) in
        while !j < n do
          composite.(!j) <- true;
          j := !j + i
        done
      end
    done;
    !count
  end

let () = Printf.printf "%d\n" (count_primes_below 100)
