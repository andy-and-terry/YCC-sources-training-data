type state = Idle | Running of int | Paused of int | Done

type event = Start | Tick | Pause | Resume | Stop

let step s e =
  match (s, e) with
  | Idle, Start -> Running 0
  | Running n, Tick -> if n >= 2 then Done else Running (n + 1)
  | Running n, Pause -> Paused n
  | Paused n, Resume -> Running n
  | _, Stop -> Done
  | s, _ -> s

let name = function
  | Idle -> "idle"
  | Running n -> Printf.sprintf "running(%d)" n
  | Paused n -> Printf.sprintf "paused(%d)" n
  | Done -> "done"

let () =
  let events = [ Start; Tick; Pause; Tick; Resume; Tick; Tick; Tick ] in
  let _ =
    List.fold_left
      (fun s e ->
        let s' = step s e in
        Printf.printf "-> %s\n" (name s');
        s')
      Idle events
  in
  ()
