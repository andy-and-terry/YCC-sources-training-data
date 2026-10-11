let () =
  let s = "   padded text   " in
  Printf.printf "[%s]\n" (String.trim s);
  let t = String.trim s in
  Printf.printf "sub: [%s]\n" (String.sub t 0 6);
  Printf.printf "tail: [%s]\n" (String.sub t 7 (String.length t - 7));
  Printf.printf "make: %s\n" (String.make 5 '=');
  Printf.printf "concat: %s\n" (String.concat ", " [ "x"; "y"; "z" ]);
  Printf.printf "equal: %b compare: %d\n" (String.equal "a" "a") (String.compare "a" "b");
  let starts_with p s =
    String.length s >= String.length p && String.sub s 0 (String.length p) = p
  in
  Printf.printf "starts with 'pad': %b\n" (starts_with "pad" t)
