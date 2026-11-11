program add_binary_strings
  implicit none
  print '(A)', add_binary('1010', '1011')  ! 10101

contains

  function add_binary(a, b) result(res)
    character(*), intent(in) :: a, b
    character(len=32) :: res
    character(len=32) :: tmp
    integer :: i, j, carry, s, k
    i = len(a)
    j = len(b)
    carry = 0
    k = 0
    do while (i > 0 .or. j > 0 .or. carry > 0)
      s = carry
      if (i > 0) then
        s = s + iachar(a(i:i)) - iachar('0')
        i = i - 1
      end if
      if (j > 0) then
        s = s + iachar(b(j:j)) - iachar('0')
        j = j - 1
      end if
      k = k + 1
      tmp(k:k) = achar(iachar('0') + mod(s, 2))
      carry = s / 2
    end do
    res = ''
    do i = 1, k
      res(i:i) = tmp(k - i + 1:k - i + 1)
    end do
  end function add_binary

end program add_binary_strings
