! Practical numbers: every m in 1..n is a sum of distinct divisors of n.
program practical_numbers
  implicit none
  integer :: n
  do n = 1, 40
    if (is_practical(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_practical(n)
    integer, intent(in) :: n
    integer(8) :: reach, mask
    integer :: d
    reach = 1_8   ! bit i set <=> i is a subset sum
    do d = 1, n
      if (mod(n, d) == 0) reach = ior(reach, ishft(reach, d))
    end do
    mask = ishft(1_8, n + 1) - 1_8
    is_practical = iand(reach, mask) == mask
  end function is_practical
end program practical_numbers
