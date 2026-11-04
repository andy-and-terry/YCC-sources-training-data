program toeplitz_check
  implicit none
  integer :: a(3,3), b(2,2)
  a = reshape([1,4,5, 2,1,4, 3,2,1], [3,3])
  b = reshape([1,2, 2,2], [2,2])
  print *, is_toeplitz(a), is_toeplitz(b)
contains
  logical function is_toeplitz(m)
    integer, intent(in) :: m(:,:)
    is_toeplitz = all(m(2:, 2:) == m(:ubound(m,1)-1, :ubound(m,2)-1))
  end function is_toeplitz
end program toeplitz_check
