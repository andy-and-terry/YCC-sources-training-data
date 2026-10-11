fun ack (0, n) = n + 1
  | ack (m, 0) = ack (m - 1, 1)
  | ack (m, n) = ack (m - 1, ack (m, n - 1))

val () =
  List.app
    (fn (m, n) =>
       print ("ack(" ^ Int.toString m ^ "," ^ Int.toString n ^ ") = "
              ^ Int.toString (ack (m, n)) ^ "\n"))
    [(0, 0), (1, 2), (2, 3), (3, 3)]
