(* Int32 and Int64 are boxed fixed-width integers with wrap-around
   arithmetic, unlike the 63-bit native int. *)

let () =
  let big = Int32.max_int in
  Printf.printf "max_int32      = %ld\n" big;
  Printf.printf "max_int32 + 1  = %ld\n" (Int32.add big 1l);

  let x = Int64.of_int max_int in
  Printf.printf "native max_int = %d\n" max_int;
  Printf.printf "as int64 + 1   = %Ld\n" (Int64.add x 1L);

  (* Conversions truncate silently. *)
  Printf.printf "of_int64 truncates: %ld\n" (Int64.to_int32 0x1_0000_0005L);

  (* Unsigned views and shifts. *)
  Printf.printf "-1l as unsigned: %lu\n" (-1l);
  Printf.printf "shift_right_logical: %ld\n" (Int32.shift_right_logical (-1l) 28);
  Printf.printf "hex: %Lx\n" (Int64.mul 0xFFFFFFFFL 0x10000L);

  (* Overflow-aware comparison needs the Int64 functions. *)
  Printf.printf "compare: %d\n" (Int64.compare Int64.min_int Int64.max_int)
