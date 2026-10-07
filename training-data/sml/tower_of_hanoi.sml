fun hanoi (0, _, _, _) = ()
  | hanoi (n, from, to, via) =
      (hanoi (n - 1, from, via, to);
       print ("Move disk " ^ Int.toString n ^ " from " ^ from ^ " to " ^ to ^ "\n");
       hanoi (n - 1, via, to, from))

val () = hanoi (3, "A", "C", "B")
