program zigzag_convert
  implicit none
  print '(a)', zigzag('PAYPALISHIRING', 3)
contains
  function zigzag(s, rows) result(out)
    character(len=*), intent(in) :: s
    integer, intent(in) :: rows
    character(len=len(s)) :: out
    integer :: n, period, r, i, k, pos
    n = len(s)
    if (rows == 1 .or. rows >= n) then
      out = s; return
    end if
    period = 2 * (rows - 1)
    pos = 0
    do r = 0, rows - 1
      do i = r + 1, n, period
        pos = pos + 1; out(pos:pos) = s(i:i)
        k = i + period - 2 * r
        if (r > 0 .and. r < rows - 1 .and. k <= n) then
          pos = pos + 1; out(pos:pos) = s(k:k)
        end if
      end do
    end do
  end function zigzag
end program zigzag_convert
