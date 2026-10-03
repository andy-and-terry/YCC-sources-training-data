let three_sum nums =
  let arr = Array.copy nums in
  Array.sort compare arr;
  let n = Array.length arr in
  let results = ref [] in
  for i = 0 to n - 3 do
    if i = 0 || arr.(i) <> arr.(i - 1) then begin
      let left = ref (i + 1) and right = ref (n - 1) in
      while !left < !right do
        let total = arr.(i) + arr.(!left) + arr.(!right) in
        if total = 0 then begin
          results := (arr.(i), arr.(!left), arr.(!right)) :: !results;
          incr left;
          decr right;
          while !left < !right && arr.(!left) = arr.(!left - 1) do incr left done;
          while !left < !right && arr.(!right) = arr.(!right + 1) do decr right done
        end else if total < 0 then incr left
        else decr right
      done
    end
  done;
  List.rev !results

let () =
  let triples = three_sum [| -1; 0; 1; 2; -1; -4 |] in
  List.iter (fun (a, b, c) -> Printf.printf "(%d, %d, %d)\n" a b c) triples
