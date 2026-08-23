let sieve limit =
  let is_composite = Array.make (limit + 1) false in
  for i = 2 to int_of_float (sqrt (float_of_int limit)) do
    if not is_composite.(i) then
      let j = ref (i * i) in
      while !j <= limit do
        is_composite.(!j) <- true;
        j := !j + i
      done
  done;
  List.filter (fun n -> not is_composite.(n)) (List.init (limit - 1) (fun i -> i + 2))

let () =
  sieve 50
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
