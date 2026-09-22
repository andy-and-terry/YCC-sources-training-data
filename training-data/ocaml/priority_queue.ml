type priority_queue = { mutable data : int array; mutable size : int }

let create () = { data = Array.make 16 0; size = 0 }

let ensure_capacity pq =
  if pq.size >= Array.length pq.data then begin
    let bigger = Array.make (Array.length pq.data * 2) 0 in
    Array.blit pq.data 0 bigger 0 pq.size;
    pq.data <- bigger
  end

let swap pq i j =
  let tmp = pq.data.(i) in
  pq.data.(i) <- pq.data.(j);
  pq.data.(j) <- tmp

let push pq value =
  ensure_capacity pq;
  pq.data.(pq.size) <- value;
  pq.size <- pq.size + 1;
  let i = ref (pq.size - 1) in
  let continue = ref true in
  while !continue && !i > 0 do
    let parent = (!i - 1) / 2 in
    if pq.data.(parent) > pq.data.(!i) then (
      swap pq parent !i;
      i := parent)
    else continue := false
  done

let pop pq =
  if pq.size = 0 then None
  else begin
    let top = pq.data.(0) in
    pq.size <- pq.size - 1;
    pq.data.(0) <- pq.data.(pq.size);
    let i = ref 0 in
    let continue = ref true in
    while !continue do
      let left = (2 * !i) + 1 and right = (2 * !i) + 2 in
      let smallest = ref !i in
      if left < pq.size && pq.data.(left) < pq.data.(!smallest) then smallest := left;
      if right < pq.size && pq.data.(right) < pq.data.(!smallest) then smallest := right;
      if !smallest <> !i then (
        swap pq !i !smallest;
        i := !smallest)
      else continue := false
    done;
    Some top
  end

let () =
  let pq = create () in
  List.iter (push pq) [ 5; 2; 9; 1; 5; 6 ];
  let rec drain () =
    match pop pq with
    | Some v ->
        Printf.printf "%d " v;
        drain ()
    | None -> print_newline ()
  in
  drain ()
