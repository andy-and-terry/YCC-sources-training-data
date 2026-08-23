let knapsack weights values capacity =
  let dp = Array.make (capacity + 1) 0 in
  List.iteri
    (fun i w ->
      let v = List.nth values i in
      for cap = capacity downto w do
        dp.(cap) <- max dp.(cap) (dp.(cap - w) + v)
      done)
    weights;
  dp.(capacity)

let () = print_int (knapsack [ 2; 3; 4; 5 ] [ 3; 4; 5; 6 ] 5); print_newline ()
