(* Fisher-Yates shuffle driven by a seeded generator, so runs are repeatable. *)
let shuffle state arr =
  let a = Array.copy arr in
  for i = Array.length a - 1 downto 1 do
    let j = Random.State.int state (i + 1) in
    let tmp = a.(i) in
    a.(i) <- a.(j);
    a.(j) <- tmp
  done;
  a

let print_array label a =
  Printf.printf "%s: [%s]\n" label
    (String.concat "; " (Array.to_list (Array.map string_of_int a)))

let () =
  let deck = Array.init 10 (fun i -> i + 1) in
  let s1 = Random.State.make [| 2024 |] in
  let s2 = Random.State.make [| 2024 |] in
  let s3 = Random.State.make [| 7 |] in
  let r1 = shuffle s1 deck and r2 = shuffle s2 deck and r3 = shuffle s3 deck in
  print_array "original" deck;
  print_array "seed 2024" r1;
  Printf.printf "same seed, same result: %b\n" (r1 = r2);
  Printf.printf "different seed differs: %b\n" (r1 <> r3);
  let sorted = Array.copy r1 in
  Array.sort compare sorted;
  Printf.printf "still a permutation: %b\n" (sorted = deck);
  let rolls = List.init 6 (fun _ -> 1 + Random.State.int s1 6) in
  Printf.printf "dice: %s\n" (String.concat " " (List.map string_of_int rolls))
