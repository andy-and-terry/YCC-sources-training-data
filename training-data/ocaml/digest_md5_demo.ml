(* Hashing strings with the Digest module (MD5) *)
let () =
  let d = Digest.string "hello" in
  Printf.printf "md5(hello) = %s\n" (Digest.to_hex d);
  Printf.printf "length of raw digest = %d\n" (String.length d);
  let same = Digest.equal (Digest.string "abc") (Digest.string "abc") in
  Printf.printf "equal digests: %b\n" same;
  let round = Digest.from_hex (Digest.to_hex d) in
  Printf.printf "hex round trip ok: %b\n" (round = d);
  Printf.printf "differs for other input: %b\n"
    (Digest.string "hello" <> Digest.string "Hello")
