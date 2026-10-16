let
  unfold = f: seed:
    let r = f seed; in if r == null then [ ] else [ r.value ] ++ unfold f r.next;
in
{
  countdown = unfold (n: if n == 0 then null else { value = n; next = n - 1; }) 5;
  powers = unfold (n: if n > 200 then null else { value = n; next = n * 3; }) 1;
}
