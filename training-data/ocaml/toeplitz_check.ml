let rec take n = function
  | x :: xs when n > 0 -> x :: take (n - 1) xs
  | _ -> []

let rec is_toeplitz = function
  | prev :: (cur :: _ as rest) ->
      List.tl cur = take (List.length cur - 1) prev && is_toeplitz rest
  | _ -> true

let () =
  Printf.printf "%b\n" (is_toeplitz [[1; 2; 3]; [4; 1; 2]; [5; 4; 1]]);
  Printf.printf "%b\n" (is_toeplitz [[1; 2]; [2; 2]])
