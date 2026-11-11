program excel_column_title
  implicit none
  print '(A,1X,A)', trim(title(28)), trim(title(701))  ! AB ZY

contains

  function title(n0) result(res)
    integer, intent(in) :: n0
    character(len=8) :: res
    integer :: n, k
    character(len=8) :: tmp
    n = n0
    k = 0
    do while (n > 0)
      n = n - 1
      k = k + 1
      tmp(k:k) = achar(iachar('A') + mod(n, 26))
      n = n / 26
    end do
    res = ''
    do n = 1, k
      res(n:n) = tmp(k - n + 1:k - n + 1)
    end do
  end function title

end program excel_column_title
