(* Count contiguous subarrays whose sum equals k (prefix sums + Hashtbl). *)
let count_subarrays nums k =
  let seen = Hashtbl.create 16 in
  Hashtbl.replace seen 0 1;
  let total = ref 0 and count = ref 0 in
  List.iter
    (fun x ->
      total := !total + x;
      (match Hashtbl.find_opt seen (!total - k) with
       | Some c -> count := !count + c
       | None -> ());
      let c = Option.value (Hashtbl.find_opt seen !total) ~default:0 in
      Hashtbl.replace seen !total (c + 1))
    nums;
  !count

let () = Printf.printf "%d\n" (count_subarrays [ 1; 1; 1 ] 2)
