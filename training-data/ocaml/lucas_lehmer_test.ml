let lucas_lehmer p =
  p = 2 ||
  (let m = (1 lsl p) - 1 in
   let s = ref 4 in
   for _i = 1 to p - 2 do
     s := (!s * !s - 2) mod m
   done;
   !s = 0)

let () =
  [2; 3; 5; 7; 11; 13; 17; 19]
  |> List.filter lucas_lehmer
  |> List.map string_of_int
  |> String.concat " "
  |> print_endline
