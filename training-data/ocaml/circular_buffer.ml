type circular_buffer = { data : int array; capacity : int; mutable size : int; mutable start : int }

let create capacity = { data = Array.make capacity 0; capacity; size = 0; start = 0 }

let push buf value =
  let index = (buf.start + buf.size) mod buf.capacity in
  buf.data.(index) <- value;
  if buf.size < buf.capacity then buf.size <- buf.size + 1
  else buf.start <- (buf.start + 1) mod buf.capacity

let to_list buf = List.init buf.size (fun i -> buf.data.((buf.start + i) mod buf.capacity))

let () =
  let buf = create 3 in
  List.iter (push buf) [ 1; 2; 3; 4; 5 ];
  to_list buf |> List.map string_of_int |> String.concat " " |> print_endline
