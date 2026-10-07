let () =
  let tasks = Queue.create () in
  Queue.push "wash dishes" tasks;
  Queue.push "write report" tasks;
  Queue.push "walk dog" tasks;
  Printf.printf "pending: %d\n" (Queue.length tasks);
  while not (Queue.is_empty tasks) do
    Printf.printf "doing: %s\n" (Queue.pop tasks)
  done;
  Printf.printf "pending: %d\n" (Queue.length tasks)
