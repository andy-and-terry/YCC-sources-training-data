program insert_interval
  implicit none
  integer, parameter :: iv(2, 2) = reshape([1, 3, 6, 9], [2, 2])  ! columns are intervals
  integer :: lo, hi, i
  logical :: placed
  lo = 2
  hi = 5
  placed = .false.
  do i = 1, 2
    if (iv(2, i) < lo) then
      write (*, '(A,I0,A,I0,A)', advance='no') '[', iv(1, i), ',', iv(2, i), '] '
    else if (iv(1, i) > hi) then
      if (.not. placed) then
        write (*, '(A,I0,A,I0,A)', advance='no') '[', lo, ',', hi, '] '
        placed = .true.
      end if
      write (*, '(A,I0,A,I0,A)', advance='no') '[', iv(1, i), ',', iv(2, i), '] '
    else
      lo = min(lo, iv(1, i))
      hi = max(hi, iv(2, i))
    end if
  end do
  if (.not. placed) write (*, '(A,I0,A,I0,A)', advance='no') '[', lo, ',', hi, '] '
  print *
end program insert_interval
