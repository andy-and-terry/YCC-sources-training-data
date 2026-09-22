(* A simple mutable hash table using a fixed number of buckets, each a
   mutable association list held in its own ref cell. Note the use of
   Array.tabulate rather than Array.array to build the bucket array:
   Array.array (n, ref []) would replicate the very same ref into every
   slot, so writing through one bucket would silently corrupt all of
   them. Array.tabulate calls the initializer once per index, giving
   each bucket its own independent ref. *)

fun makeTable size = Array.tabulate (size, fn _ => ref ([] : (string * int) list))

fun hashOf (key, size) =
  let
    fun loop (i, acc) =
      if i = String.size key then acc
      else loop (i + 1, (acc * 31 + Char.ord (String.sub (key, i))) mod size)
  in
    loop (0, 0)
  end

fun insert (table, key, value) =
  let
    val size = Array.length table
    val idx = hashOf (key, size)
    val bucket = Array.sub (table, idx)
    val filtered = List.filter (fn (k, _) => k <> key) (!bucket)
  in
    bucket := (key, value) :: filtered
  end

fun lookup (table, key) =
  let
    val size = Array.length table
    val idx = hashOf (key, size)
    val bucket = !(Array.sub (table, idx))
  in
    case List.find (fn (k, _) => k = key) bucket of
      SOME (_, v) => SOME v
    | NONE => NONE
  end

val table = makeTable 8
val () = insert (table, "apple", 1)
val () = insert (table, "banana", 2)
val () = insert (table, "cherry", 3)
val () = insert (table, "apple", 10) (* overwrite *)

fun show key =
  case lookup (table, key) of
    SOME v => print (key ^ " -> " ^ Int.toString v ^ "\n")
  | NONE => print (key ^ " -> not found\n")

val () = show "apple"
val () = show "banana"
val () = show "cherry"
val () = show "durian"
