(* Bulls and Cows scoring for equal-length digit strings. *)
let score secret guess =
  let bulls = ref 0 in
  let sc = Array.make 10 0 and gc = Array.make 10 0 in
  String.iteri
    (fun i s ->
      let g = guess.[i] in
      if s = g then incr bulls
      else begin
        let si = Char.code s - 48 and gi = Char.code g - 48 in
        sc.(si) <- sc.(si) + 1;
        gc.(gi) <- gc.(gi) + 1
      end)
    secret;
  let cows = ref 0 in
  Array.iteri (fun d n -> cows := !cows + min n gc.(d)) sc;
  (!bulls, !cows)

let () =
  let b, c = score "1807" "7810" in
  Printf.printf "%d bull(s), %d cow(s)\n" b c
