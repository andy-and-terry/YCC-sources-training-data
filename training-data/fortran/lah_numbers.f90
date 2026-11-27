program lah_numbers
  implicit none
  integer :: n, k
  do n = 1, 5
    do k = 1, n
      write (*, '(I6)', advance='no') lah(n, k)
    end do
    print *
  end do
contains
  integer function lah(n, k)
    integer, intent(in) :: n, k
    integer :: c, f, i
    c = 1
    f = 1
    do i = 0, k - 2
      c = c * (n - 1 - i) / (i + 1)
    end do
    do i = k + 1, n
      f = f * i
    end do
    lah = c * f
  end function lah
end program lah_numbers
