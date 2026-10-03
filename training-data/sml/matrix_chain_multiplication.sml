val inf = 1000000000

fun make_matrix n init =
  Array.tabulate (n, fn _ => Array.tabulate (n, fn _ => init))

fun mref (m, i, j) = Array.sub (Array.sub (m, i), j)
fun mset (m, i, j, v) = Array.update (Array.sub (m, i), j, v)

(* dims has n+1 entries: dims[i-1] x dims[i] is the shape of matrix i *)
fun matrix_chain_order dims =
  let
    val n = Array.length dims - 1
    val dp = make_matrix (n + 1) 0
    val () =
      List.app
        (fn len =>
          List.app
            (fn i =>
              let
                val j = i + len - 1
              in
                if j > n then ()
                else
                  let
                    val best = ref inf
                    val () =
                      List.app
                        (fn k =>
                          let
                            val cost =
                              mref (dp, i, k) + mref (dp, k + 1, j)
                              + Array.sub (dims, i - 1) * Array.sub (dims, k) * Array.sub (dims, j)
                          in
                            if cost < !best then best := cost else ()
                          end)
                        (List.tabulate (j - i, fn x => i + x))
                  in
                    mset (dp, i, j, !best)
                  end
              end)
            (List.tabulate (n - len + 2, fn x => x + 1)))
        (List.tabulate (n, fn x => x + 2))
  in
    mref (dp, 1, n)
  end

val dims = Array.fromList [40, 20, 30, 10, 30]
val () = print (Int.toString (matrix_chain_order dims) ^ "\n")
