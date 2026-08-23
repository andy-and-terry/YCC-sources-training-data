let kadane lst =
  match lst with
  | [] -> 0
  | h :: t ->
      let best, _ =
        List.fold_left
          (fun (best, current) x ->
            let new_current = max x (current + x) in
            (max best new_current, new_current))
          (h, h) t
      in
      best

let () = print_int (kadane [ -2; 1; -3; 4; -1; 2; 1; -5; 4 ]); print_newline ()
