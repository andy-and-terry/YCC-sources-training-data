let rec popcount n = if n = 0 then 0 else 1 + popcount (n land (n - 1))

let () = Printf.printf "%d %d\n" (popcount 0xB7) (popcount 255)
