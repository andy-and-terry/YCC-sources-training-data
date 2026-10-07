let sort_colors arr =
  let low = ref 0 and mid = ref 0 and high = ref (Array.length arr - 1) in
  while !mid <= !high do
    match arr.(!mid) with
    | 0 ->
        let tmp = arr.(!low) in
        arr.(!low) <- arr.(!mid);
        arr.(!mid) <- tmp;
        incr low;
        incr mid
    | 1 -> incr mid
    | _ ->
        let tmp = arr.(!mid) in
        arr.(!mid) <- arr.(!high);
        arr.(!high) <- tmp;
        decr high
  done

let () =
  let arr = [| 2; 0; 2; 1; 1; 0 |] in
  sort_colors arr;
  Array.iter (Printf.printf "%d ") arr;
  print_newline ()
