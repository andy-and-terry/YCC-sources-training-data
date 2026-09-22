(* The Strategy pattern falls out naturally in OCaml: a "strategy" is
   just a first-class function, and the context holds one in a mutable
   field instead of dispatching through an interface/vtable. *)

type strategy = int list -> int list

let bubble_sort : strategy =
 fun lst ->
  let arr = Array.of_list lst in
  let n = Array.length arr in
  for i = 0 to n - 1 do
    for j = 0 to n - i - 2 do
      if arr.(j) > arr.(j + 1) then begin
        let tmp = arr.(j) in
        arr.(j) <- arr.(j + 1);
        arr.(j + 1) <- tmp
      end
    done
  done;
  Array.to_list arr

let stdlib_sort : strategy = fun lst -> List.sort compare lst

type context = { mutable strategy : strategy }

let make_context strategy = { strategy }
let set_strategy ctx strategy = ctx.strategy <- strategy
let execute ctx lst = ctx.strategy lst

let print_ints lst = lst |> List.map string_of_int |> String.concat " " |> print_endline

let () =
  let data = [ 5; 2; 8; 1; 9; 3 ] in
  let ctx = make_context bubble_sort in
  print_ints (execute ctx data);

  set_strategy ctx stdlib_sort;
  print_ints (execute ctx data)
