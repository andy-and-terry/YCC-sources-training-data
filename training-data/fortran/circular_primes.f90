! Circular primes below 100; expect 13.
program circular_primes
  implicit none
  integer :: c, p, n

  c = 0
  do n = 2, 99
    if (circular(n)) c = c + 1
  end do
  print '(I0)', c
contains
  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: d
    is_prime = .false.
    if (n < 2) return
    is_prime = .true.
    d = 2
    do while (d * d <= n)
      if (mod(n, d) == 0) then
        is_prime = .false.
        return
      end if
      d = d + 1
    end do
  end function is_prime

  logical function circular(n)
    integer, intent(in) :: n
    integer :: x, scale, k
    scale = 1
    do while (scale * 10 <= n)
      scale = scale * 10
    end do
    x = n
    circular = .true.
    do k = 1, len_trim(int_str(n))
      if (.not. is_prime(x)) circular = .false.
      x = mod(x, 10) * scale + x / 10
    end do
  end function circular

  function int_str(n) result(s)
    integer, intent(in) :: n
    character(len=12) :: s
    write (s, '(I0)') n
  end function int_str
end program circular_primes
