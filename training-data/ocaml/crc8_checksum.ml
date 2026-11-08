let crc8 s =
  let crc = ref 0 in
  String.iter (fun ch ->
    crc := !crc lxor Char.code ch;
    for _ = 1 to 8 do
      crc := if !crc land 0x80 <> 0 then ((!crc lsl 1) lxor 0x07) land 0xFF
             else (!crc lsl 1) land 0xFF
    done) s;
  !crc

let () = Printf.printf "%02x\n" (crc8 "123456789")
