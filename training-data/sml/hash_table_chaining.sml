datatype 'a hash_table = HT of { buckets: (int * 'a) list array, capacity: int }

fun new_table capacity = HT { buckets = Array.array (capacity, []), capacity = capacity }

fun ht_insert (HT { buckets, capacity }, key, value) =
  let
    val idx = key mod capacity
    val bucket = Array.sub (buckets, idx)
    val filtered = List.filter (fn (k, _) => k <> key) bucket
  in
    Array.update (buckets, idx, (key, value) :: filtered)
  end

fun ht_lookup (HT { buckets, capacity }, key) =
  let
    val idx = key mod capacity
    val bucket = Array.sub (buckets, idx)
  in
    case List.find (fn (k, _) => k = key) bucket of
      SOME (_, v) => SOME v
    | NONE => NONE
  end

val table = new_table 8
val () = ht_insert (table, 1, "one")
val () = ht_insert (table, 9, "nine")
val () = ht_insert (table, 2, "two")
val () = print ((case ht_lookup (table, 1) of SOME v => v | NONE => "none") ^ "\n")
val () = print ((case ht_lookup (table, 9) of SOME v => v | NONE => "none") ^ "\n")
val () = print ((case ht_lookup (table, 3) of SOME v => v | NONE => "none") ^ "\n")
