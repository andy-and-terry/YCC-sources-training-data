let plus_one digits =
  let carry, result =
    List.fold_right
      (fun d (c, acc) ->
        let s = d + c in
        (s / 10, (s mod 10) :: acc))
      digits (1, [])
  in
  if carry > 0 then carry :: result else result

let show l = print_endline (String.concat "," (List.map string_of_int l))

let () =
  show (plus_one [ 1; 2; 9 ]);
  (* 1,3,0 *)
  show (plus_one [ 9; 9 ]) (* 1,0,0 *)
