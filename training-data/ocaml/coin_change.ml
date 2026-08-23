let min_coins coins amount =
  let dp = Array.make (amount + 1) (-1) in
  dp.(0) <- 0;
  for n = 1 to amount do
    List.iter
      (fun c ->
        if c <= n && dp.(n - c) <> -1 then
          if dp.(n) = -1 || dp.(n - c) + 1 < dp.(n) then dp.(n) <- dp.(n - c) + 1)
      coins
  done;
  dp.(amount)

let () = print_int (min_coins [ 1; 2; 5 ] 11); print_newline ()
