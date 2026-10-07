(* A simplified skip list: express-lane structure via a top level
   that skips by a fixed stride, falling back to the base list for
   the final scan. Demonstrates the idea without a mutable
   multi-level pointer structure. *)
fun make_skip_list (xs, stride) =
  let
    val base = Vector.fromList xs (* assumed sorted *)
    val n = Vector.length base
    val express =
      Vector.fromList
        (List.filter (fn i => i mod stride = 0) (List.tabulate (n, fn i => i)))
  in
    (base, express, stride)
  end

fun skip_search ((base, express, stride), target) =
  let
    val n = Vector.length base
    fun find_block i =
      if i >= Vector.length express then Vector.length express - 1
      else if Vector.sub (base, Vector.sub (express, i)) > target then i - 1
      else find_block (i + 1)
    val block = find_block 0
    val start = if block < 0 then 0 else Vector.sub (express, block)
    val limit = Int.min (n, start + stride)
    fun scan i =
      if i >= limit then NONE
      else if Vector.sub (base, i) = target then SOME i
      else scan (i + 1)
  in
    scan start
  end

val sl = make_skip_list ([2, 4, 7, 9, 12, 15, 19, 22, 26, 30], 3)
val () =
  case skip_search (sl, 19) of
    SOME idx => print ("found at " ^ Int.toString idx ^ "\n")
  | NONE => print "not found\n"
val () =
  case skip_search (sl, 13) of
    SOME idx => print ("found at " ^ Int.toString idx ^ "\n")
  | NONE => print "not found\n"
