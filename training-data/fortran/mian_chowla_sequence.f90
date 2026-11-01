! Greedy sequence whose pairwise sums are all distinct.
program mian_chowla_sequence
  implicit none
  integer :: seq(8), n, cand, i, s
  logical :: used(0:255), fresh(0:255), ok
  used = .false.
  n = 0
  cand = 1
  do while (n < 8)
    fresh = .false.
    ok = .true.
    seq(n + 1) = cand
    do i = 1, n + 1
      s = seq(i) + cand
      if (used(s) .or. fresh(s)) then
        ok = .false.
        exit
      end if
      fresh(s) = .true.
    end do
    if (ok) then
      used = used .or. fresh
      n = n + 1
    end if
    cand = cand + 1
  end do
  write (*, '(8(I0,1X))') seq
end program mian_chowla_sequence
