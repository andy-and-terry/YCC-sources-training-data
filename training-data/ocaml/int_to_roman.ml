(* Integer (1..3999) to Roman numeral using a greedy table. *)
let table =
  [ (1000, "M"); (900, "CM"); (500, "D"); (400, "CD"); (100, "C"); (90, "XC");
    (50, "L"); (40, "XL"); (10, "X"); (9, "IX"); (5, "V"); (4, "IV"); (1, "I") ]

let to_roman n =
  let buf = Buffer.create 16 in
  let _ =
    List.fold_left
      (fun n (value, symbol) ->
        let n = ref n in
        while !n >= value do
          Buffer.add_string buf symbol;
          n := !n - value
        done;
        !n)
      n table
  in
  Buffer.contents buf

let () = Printf.printf "%s %s\n" (to_roman 1994) (to_roman 58)
