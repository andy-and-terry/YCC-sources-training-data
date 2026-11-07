program plus_one_digits
  implicit none
  integer :: d(0:2), i
  logical :: done
  d = [0, 9, 9]          ! slot 0 is reserved for a carry-out digit
  done = .false.
  do i = 2, 1, -1
    if (d(i) < 9) then
      d(i) = d(i) + 1
      done = .true.
      exit
    end if
    d(i) = 0
  end do
  if (.not. done) d(0) = 1
  print '(3I1)', d      ! 100
end program plus_one_digits
