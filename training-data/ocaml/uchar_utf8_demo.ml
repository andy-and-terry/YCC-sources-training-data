(* OCaml strings are bytes; Uchar and the UTF-8 helpers in String
   (OCaml 4.14+) decode them into Unicode scalar values. *)

let code_points s =
  let rec go i acc =
    if i >= String.length s then List.rev acc
    else
      let d = String.get_utf_8_uchar s i in
      go (i + Uchar.utf_decode_length d) (Uchar.to_int (Uchar.utf_decode_uchar d) :: acc)
  in
  go 0 []

let () =
  let s = "aé€😀" in
  Printf.printf "bytes: %d\n" (String.length s);
  Printf.printf "code points: %d\n" (List.length (code_points s));
  List.iter (fun cp -> Printf.printf "U+%04X\n" cp) (code_points s);

  (* Encode a code point back into a UTF-8 string. *)
  let b = Buffer.create 8 in
  Buffer.add_utf_8_uchar b (Uchar.of_int 0x20AC);
  Buffer.add_utf_8_uchar b (Uchar.of_char 'x');
  Printf.printf "encoded: %s (%d bytes)\n" (Buffer.contents b) (Buffer.length b);
  Printf.printf "valid: %b\n" (String.is_valid_utf_8 s)
