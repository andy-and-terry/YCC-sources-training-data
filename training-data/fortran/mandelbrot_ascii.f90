program mandelbrot_ascii
  implicit none
  integer :: xi, yi, n
  complex :: z, c
  character(len=53) :: line
  do yi = -5, 5
     do xi = -40, 12
        c = cmplx(xi / 20.0, yi / 5.0)
        z = (0.0, 0.0)
        n = 0
        do while (n < 30 .and. abs(z) < 2.0)
           z = z * z + c
           n = n + 1
        end do
        line(xi + 41:xi + 41) = merge('#', '.', n == 30)
     end do
     print '(a)', line
  end do
end program mandelbrot_ascii
