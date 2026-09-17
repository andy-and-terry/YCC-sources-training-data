(* A minimal priority queue kept as a sorted list of (priority, value)
   pairs, so the minimum element is always at the head. *)
type 'a pqueue = (int * 'a) list

let empty : 'a pqueue = []

let insert (pq : 'a pqueue) priority value : 'a pqueue =
  let rec go = function
    | [] -> [ (priority, value) ]
    | (p, v) :: rest -> if priority <= p then (priority, value) :: (p, v) :: rest else (p, v) :: go rest
  in
  go pq

let pop (pq : 'a pqueue) =
  match pq with
  | [] -> None
  | (p, v) :: rest -> Some (p, v, rest)

let () =
  let pq = empty in
  let pq = insert pq 5 "medium" in
  let pq = insert pq 1 "urgent" in
  let pq = insert pq 9 "low" in
  let rec drain pq =
    match pop pq with
    | None -> ()
    | Some (p, v, rest) ->
        Printf.printf "%d: %s\n" p v;
        drain rest
  in
  drain pq
